import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "star"];

  connect() {
    this.currentRating = this.inputTarget.value || 0;
    this.hoveredRating = 0;

    const starsContainer = document.createElement("div");
    starsContainer.classList.add("stars-row");
    starsContainer.setAttribute("data-action", "mouseout->stars#ratingHoveredOut");

    for (let i = 1; i <= 5; i++) {
      const star = document.createElement("div");
      star.classList.add("star");
      star.setAttribute("data-stars-target", "star");
      star.setAttribute("data-action", `mouseover->stars#starHovered click->stars#starClicked`);
      star.dataset.starValue = i;
      starsContainer.append(star);
    }

    this.inputTarget.parentNode.insertBefore(starsContainer, this.inputTarget.nextSibling);
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
