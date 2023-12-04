import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-by-company"
export default class extends Controller {
  static targets = [ "company", "companyRow"]

  connect() {
    console.log(this.companyTargets)
    console.log(this.companyRowTargets)
  }

  search(e) {
    console.log('hello from search')
    console.log(e.target)

    console.log(this.companyTargets.indexOf(e.target))

    let company = e.target
    while (this.companyTargets.indexOf(company) == -1) {
      company = company.parentElement
    }
    console.log(company)
    console.log(this.companyTargets.indexOf(company))
    // update the anchor href to include the search term  (e.g. /jobs?search=term)
    console.log(window.location.href)
    console.log(company.attributes.for.value)
    // this.companyTargets.forEach((company) => { company.classList.add('hidden') })  // hide all companies


    this.companyRowTargets.forEach((companyRow) => {
      if (companyRow.querySelector(".companyName").innerText == company.attributes.for.value) {
        companyRow.classList.remove('d-none')
      } else {
        companyRow.classList.add('d-none')
      }
    })

    // window.location.href = window.location.href.split("company=")[0] + "company=" + company.attributes.for.value + (window.location.href.split("company=")[1].split("&")[1] == undefined ? "" : "&" + window.location.href.split("company=")[1].split("&")[1] )
  }
}
