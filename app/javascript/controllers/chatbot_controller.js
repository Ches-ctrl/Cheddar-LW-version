import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chatbot"
export default class extends Controller {
  static targets = ["input", "messages", "modal"]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  open() {
    console.log("Open modal")
    this.modalTarget.classList.add("show");
    this.modalTarget.style.display = "block";
    this.initializeOpenAIClient();
  }

  close() {
    console.log("Close modal")
    this.modalTarget.classList.remove("show");
    this.modalTarget.style.display = "none";
  }

  initializeOpenAIClient() {
    // Code to initialize or flag the OpenAI client
    console.log("Initializing OpenAI client");
    // Actual initialization should be done server-side
  }

  chat() {
    const message = this.inputTarget.value.trim();
    if (message === "") return;
    fetch('/chatbot/chat', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector("[name='csrf-token']").content
      },
      body: JSON.stringify({ content: message })
    })
    .then(response => response.json())
    .then(data => {
      // Handle the response
      this.appendMessage("User", message); // Append user's message
      if (data.chatbotResponse) {
        this.appendMessage("CheddarGPT", data.chatbotResponse); // Append chatbot's response
        console.log(data.chatbotResponse)
      }
    });

    this.inputTarget.value = "";
  }

  appendMessage(sender, text) {
    console.log(sender)
    console.log(text)

    let messageElement = document.createElement("div");
    console.log(messageElement)

    messageElement.innerHTML = `<p>${text}</p>`;

    messageElement.classList.add("message-card", sender === "User" ? "self" : "");

    // messageElement.classList.add("message-card", sender === "User" ? "self" : "");


    console.log(messageElement)
    messageElement.innerHTML = `<p>${text}</p>`;
    console.log(messageElement)

    // Assuming 'messagesTarget' is the container for chat messages
    this.messagesTarget.appendChild(messageElement);
    console.log(this.messagesTarget)

    // Scroll to the latest message
    this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight;
  }
}
