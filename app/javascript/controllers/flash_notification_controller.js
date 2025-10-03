import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash-notification"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      this._closeFlash()
    }, 3000)
  }

  _closeFlash(){
    this.element.classList.remove("flex")
    this.element.classList.add("hidden")
  }
}
