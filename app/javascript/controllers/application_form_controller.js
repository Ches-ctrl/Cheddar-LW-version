import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log('Individual controller connected');
  }

  submitForm(event) {
    event.preventDefault();
    console.log("reading");
    const formData = new FormData(this.formTarget);

    fetch(this.formTarget.action, {
      method: this.formTarget.method,
      body: formData
    }).then(response => {
      // Handle response
    }).catch(error => {
      // Handle error
    });
  }
}
