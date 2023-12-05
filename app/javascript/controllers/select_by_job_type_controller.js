import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-by-job-type"
export default class extends Controller {
  static targets = [ 'type', 'jobRow' ]

  connect() {
    // console.log('hello from Job Type Stimulus Controller')
    // this.typeTargets.forEach((type) => {
    //   console.log(type.id)})
  }

  searchByJobType(e) {
    const checkedTypes = this.typeTargets.filter(type => type.checked)
      .map(type => type.id)

    // console.log(checkedTypes)
    // console.log(this.jobRowTargets)

    const patternStrings = []

    checkedTypes.forEach((query) => {
      const regexd_query = '(' + query.replace(' ', '(-| )?') + ')'
      console.log(regexd_query)
      patternStrings.push(regexd_query)
    })

    const pattern = new RegExp(patternStrings.join('|'), 'i');

    this.jobRowTargets.forEach((jobRow) => {
      const jobTitle = jobRow.querySelector(".role").innerText

      // console.log(jobTitle.split(' '))
      if (pattern.test(jobTitle)) {
        jobRow.classList.remove('d-none')
      } else {
        // reject
        jobRow.classList.add('d-none')
      }


      // if ( jobTitle.split(' ').some((word) => checkedTypes.includes(word)) ) {
      //   console.log('matched something')
      //   // jobRow.classList.remove('d-none')
      // } else {
      //   console.log('did not match anything')
      //   // jobRow.classList.add('d-none')
      // }


      // if (checkedTypes.includes(jobTitle.split(' '))) {
      //   jobRow.classList.remove('d-none')
      // } else {
      //   jobRow.classList.add('d-none')
      // }


      // if (checkedTypes.some((item) => item.includes(jobTitle.split(' ').some))) {
      //   console.log('matched something')
      //   // jobRow.classList.remove('d-none')
      // } else {
      //   jobRow.classList.add('d-none')
      // }

    })
  }
}

// [1, 2, 3].some((num) => num % 2 === 0);
