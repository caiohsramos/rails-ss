import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["item", "details", "itemLink", "itemRead", "itemStarred"];
  static classes = ["current"];

  initialize() {
    this.index = 0;
  }

  setIndex({ params: { id } }) {
    this.itemTargets[this.index].classList.remove(this.currentClass);
    this.index = id;
    this.itemTargets[id].classList.add(this.currentClass);
  }

  highlightNext() {
    if (this.index === this.itemTargets.length) return;
    this.setIndex({ params: { id: this.index + 1 } });
    this.itemTargets[this.index].scrollIntoView({
      block: "nearest",
    });
  }

  highlightPrevious() {
    if (this.index === 0) return;
    this.setIndex({ params: { id: this.index - 1 } });
    this.itemTargets[this.index].scrollIntoView({
      block: "nearest",
    });
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
