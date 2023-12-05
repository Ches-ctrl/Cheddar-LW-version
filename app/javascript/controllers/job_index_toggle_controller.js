import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["search", "button"];

  connect() {
    console.log("confetti");
  }

  toggleSearch() {
    this.searchTarget.classList.toggle('d-none');
    // TODO: toggle the classes of the RHS table to be full-width

  }
}
