import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["toggle-button", "dropdownMenu", "close"];
  connect() {
      if (this.dropdownMenuTarget.style.transform === 'translateX(0)') {
          this.toggle();
      }
  }

  toggle() {
    this.dropdownMenuTarget.style.transform = this.dropdownMenuTarget.style.transform === 'translateX(0)' ? 'translateX(-100%)' : 'translateX(0)'
  }
}
