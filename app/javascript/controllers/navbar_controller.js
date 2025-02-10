import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  toggle () {
    const sidebar = document.getElementById('navMenu')
    sidebar.classList.toggle('active')
  }
}
