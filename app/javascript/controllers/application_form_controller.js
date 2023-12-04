import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log('Individual controller connected');
  }

  submitForm(event) {
    console.log("reading")
    event.preventDefault();
    const formData = new FormData(this.formTarget);

    fetch(this.formTarget.action, {
      method: 'POST',
      body: formData
    }).then(response => {
      // Handle response
    }).catch(error => {
      // Handle error
    });
  }
}
