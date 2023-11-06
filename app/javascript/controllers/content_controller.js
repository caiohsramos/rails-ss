import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["item", "details", "itemLink", "itemRead", "itemStarred"];

  initialize() {
    this.index = 0;
  }

  setIndex({ params: { id } }) {
    this.index = id;
  }

  highlightNext() {
    if (this.index === this.itemTargets.length) return;
    this.index += 1;
    this.itemTargets[this.index].scrollIntoView({ behavior: "smooth" });
  }

  highlightPrevious() {
    if (this.index === 0) return;
    this.index -= 1;
    this.itemTargets[this.index].scrollIntoView({ behavior: "smooth" });
  }

  toggleCurrent() {
    this.detailsTargets[this.index].open =
      !this.detailsTargets[this.index].open;
  }

  toggleReadCurrent() {
    this.itemReadTargets[this.index].click();
  }

  toggleStarredCurrent() {
    this.itemStarredTargets[this.index].click();
  }

  openCurrent() {
    this.itemLinkTargets[this.index].click();
  }
}
