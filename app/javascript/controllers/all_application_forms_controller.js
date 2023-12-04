import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('Parent controller connected');
  }

  submitAllForms() {
    this.application.controllers.forEach(controller => {
      if (controller.identifier === "application-form") {
        controller.submitForm();
      }
    });
  }
}
