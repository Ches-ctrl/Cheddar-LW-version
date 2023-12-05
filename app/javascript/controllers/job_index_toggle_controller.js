import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["index", "company", "salary", "lhsSection"];

  connect() {
    console.log("Hello, Stimulus Toggle!")
  }

  toggleLhs() {
    this.Target.classList.toggle('d-none');
    console.log(thi.Target)
  }
}
