// app/javascript/controllers/movie_search_controller.js

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 200)
  }
}
