import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-by-company"
export default class extends Controller {
  static targets = [ "company", "companyRow", "salary", "index", "button"]

  connect() {
  }

  searchByCompany() {
    const checkedCompanies = this.companyTargets.filter(company => company.checked)
      .map(company => company.attributes.id.value)

    this.companyRowTargets.forEach((companyRow) => {

      if (checkedCompanies.includes(companyRow.querySelector(".companyName").innerText)) {
        companyRow.classList.remove('d-none')
      } else {
        companyRow.classList.add('d-none')
      }
      // companyRow.classList.toggle('d-none', !checkedCompanies.includes(companyRow.querySelector(".companyName").innerText))
    })

    if (checkedCompanies.length == 0) {
      this.companyRowTargets.forEach((companyRow) => {
        companyRow.classList.remove('d-none')})
    }
  }

  revealCompanies(event) {
    event.preventDefault()
    if (this.buttonTarget.innerText == 'Show all') {
      this.indexTarget.classList.remove('d-none')
      this.buttonTarget.innerText = 'Hide all'
    } else {
      this.indexTarget.classList.add('d-none')
      this.buttonTarget.innerText = 'Show all'
    } end
  }

}
