import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-by-company"
export default class extends Controller {
  static targets = [ "company", "companyRow", "salary", "index", "button"]

  connect() {
    // console.log(this.companyTargets)
    // console.log(this.companyRowTargets)
    // console.log(this.salaryTargets)
  }

  searchByCompany(e) {
    // console.log(e.target)
    // console.log(this.companyTargets.indexOf(e.target))
    const checkedCompanies = this.companyTargets.filter(company => company.checked)
      .map(company => company.attributes.id.value)
    // const company = e.target
    // while (this.companyTargets.indexOf(company) == -1) {
    //   company = company.parentElement
    // }
    // console.log(company)
    // console.log(this.companyTargets.indexOf(company))
    // update the anchor href to include the search term  (e.g. /jobs?search=term)
    // console.log(window.location.href)
    // this.companyTargets.forEach((company) => { company.classList.add('hidden') })  // hide all companies


    this.companyRowTargets.forEach((companyRow) => {

      if (checkedCompanies.includes(companyRow.querySelector(".companyName").innerText)) {
        companyRow.classList.remove('d-none')
      } else {
        companyRow.classList.add('d-none')
      }
      // companyRow.classList.toggle('d-none', !checkedCompanies.includes(companyRow.querySelector(".companyName").innerText))
    })
    // window.location.href = window.location.href.split("company=")[0] + "company=" + company.attributes.id + (window.location.href.split("company=")[1].split("&")[1] == undefined ? "" : "&" + window.location.href.split("company=")[1].split("&")[1] )

  }

  revealCompanies(event) {
    event.preventDefault()
    this.indexTarget.classList.toggle('d-none')
    this.buttonTarget.innerText = 'Hide Companies'
  }

}
