import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "star"];

  connect() {
    this.currentRating = this.inputTarget.value || 0;
    this.hoveredRating = 0;
    this.renderRating();
  }

  ratingHoveredOut() {
    this.hoveredRating = 0;
    this.renderRating();
  }

  renderRating() {
    const rating = this.hoveredRating || this.currentRating;

    this.starTargets.forEach((star, index) => {
      star.classList.toggle('active', index + 1 <= rating);
    });

    const submitButton = this.inputTarget.form.querySelector("[type=submit]");
    submitButton.disabled = rating === 0;
  }

  starHovered(event) {
    this.hoveredRating = event.target.dataset.starValue;
    this.renderRating();
  }

  starClicked(event) {
    this.currentRating = event.target.dataset.starValue;
    this.inputTarget.value = this.currentRating;
    this.renderRating();
  }
}
