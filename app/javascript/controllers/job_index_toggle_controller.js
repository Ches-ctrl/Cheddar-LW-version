import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["index", "company", "salary", "lhsSection"];

  connect() {
    console.log("confetti");
  }

  toggleLhs() {
    this.Target.classList.toggle('d-none');
    // TODO: toggle the classes of the RHS table to be full-width
  }
}
