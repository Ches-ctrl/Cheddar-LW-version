import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="styling-selected-job"
export default class extends Controller {
  static targets = [ 'jobCard' ]

  connect() {
    console.log('hello from styling controller')
    console.log(this.jobCardTargets)
  }

  styleCard() {
    
  }
}
