import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="confetti"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus Confetti!")
  }
}