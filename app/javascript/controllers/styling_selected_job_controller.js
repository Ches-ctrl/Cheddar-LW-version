import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="styling-selected-job"
export default class extends Controller {
  static targets = [ 'jobCard', 'checkBox' ]

  connect() {

  }

  styleCard() {

    // console.log(this.jobCardTargets)
    console.log(this.checkBoxTargets)
    this.checkBoxTargets.forEach((checkBox) => {
      // console.log(checkBox.checked)

      if (checkBox.checked) {
        console.log(checkBox)
        checkBox.parentElement.parentElement.parentElement.parentElement.classList.add('selected-job-card')
      } else {
        checkBox.parentElement.parentElement.parentElement.parentElement.classList.remove('selected-job-card')
      }

    })


    // this.jobCardTargets.forEach((jobCard) => {
    //   console.log('styling some cards...')
    //   const selectBox = jobCard.querySelector(".selectBox")
    //   console.log(selectBox)

    //   // console.log(this.jobCardTargets.filter(card => card.checked))
    // })

  }
}
