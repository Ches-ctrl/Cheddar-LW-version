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

    this.jobRowTargets.forEach((jobRow) => {
      const jobTitle = jobRow.querySelector(".role").innerText.toLowerCase().replace('-', ' ')
      // console.log(jobTitle.split(' '))

      if ( jobTitle.split(' ').some((word) => checkedTypes.includes(word) ) ) {
        console.log('matched something')
        // jobRow.classList.remove('d-none')
      } else {
        console.log('did not match anything')
        // jobRow.classList.add('d-none')
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
