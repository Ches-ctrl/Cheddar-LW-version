require 'nokogiri'

class GetHtmlJob < ApplicationJob
  include Capybara::DSL

  queue_as :default

  def perform(url, required_html_element)
    visit(url)

    begin
      # page_html = page.html
      element = find(required_html_element)

      # Extract element HTML from Capybara element
      element_html = page.evaluate_script("arguments[0].outerHTML", element.native)

      # Convert Capybara element to a Nokogiri element
      nokogiri_element = Nokogiri::HTML.fragment(element_html)


      # # Remove style attributes from all elements
      nokogiri_element.traverse { |node| node.delete('style') }

      # Get the HTML content of the element element without style properties
      cleaned_html = nokogiri_element.to_html

      puts "Cleaned HTML:"
      puts cleaned_html

      puts "Length: #{cleaned_html.size} characters"
      puts "Tokens required: #{OpenAI.rough_token_count(cleaned_html)}"

    rescue Capybara::ElementNotFound => e
      puts "Element not found: #{e.message}"
    end
  end
end

# ---------------
# Extract just the relevant input elements within a form:
# ---------------

# simplified_form = Nokogiri::HTML::DocumentFragment.parse("")

# nokogiri_form.css('input, select, textarea, label').each do |element|
#   # Clone the element to modify it
#   cloned_element = element.clone

#   # Remove all attributes except the essentials
#   cloned_element.attributes.each do |name, _|
#     unless ['id', 'name', 'type', 'aria-labelledby', 'for', 'value'].include?(name)
#       cloned_element.remove_attribute(name)
#     end
#   end

#   # Add to simplified form
#   simplified_form.add_child(cloned_element)
# end

# # puts "Simplified form:"
# # puts simplified_form

# simplified_html = simplified_form.to_html
