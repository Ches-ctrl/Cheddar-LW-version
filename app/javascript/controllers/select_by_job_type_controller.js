import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-by-job-type"
export default class extends Controller {
  static targets = [ 'type', 'jobRow' ]

  connect() {
  }

  searchByJobType() {
    const checkedTypes = this.typeTargets.filter(type => type.checked)
      .map(type => type.id)

    const patternStrings = []

    checkedTypes.forEach((query) => {
      const regexd_query = '(' + query.replace(' ', '(-| )?') + ')'
      // console.log(regexd_query)
      patternStrings.push(regexd_query)
    })

    const pattern = new RegExp(patternStrings.join('|'), 'i');

    this.jobRowTargets.forEach((jobRow) => {
      const jobTitle = jobRow.querySelector(".role").dataset.role;
      console.log(jobRow.querySelector(".role"))
      console.log(jobRow.querySelector(".role").dataset)
      console.log(jobTitle);
      console.log(pattern)
      console.log(pattern.test(jobTitle))
      if (pattern.test(jobTitle)) {
        jobRow.classList.remove('d-none')
      } else {
        jobRow.classList.add('d-none')
      }
    })
  }
}
