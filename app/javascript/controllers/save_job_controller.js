import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="save-job"
export default class extends Controller {
  static targets = [ 'button' ]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  save() {
    console.log("Saving this job")

    const url = '/saved_jobs_controller.rb/create'

    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: {}
    })
      .then(response => response.json())
      .then(data => {console.log(data)})

  }
}
