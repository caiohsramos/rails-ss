import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["filterSelect", "readAllForm", "listItem"];

  // 1, 2, 3
  selectAll() {
    this.selectFilter(0);
  }
  selectUnread() {
    this.selectFilter(1);
  }
  selectStarred() {
    this.selectFilter(2);
  }
  selectFilter(index) {
    this.filterSelectTarget.selectedIndex = index;
    this.filterSelectTarget.form.requestSubmit();
  }

  // shift+r
  readAll() {
    this.readAllFormTarget.requestSubmit();
  }

  // f, b
  scrollContentDown() {
    window.scrollBy(0, 200);
  }
  scrollContentUp() {
    window.scrollBy(0, -200);
  }

  // h, l
  nextFeed() {
    this.listItemTargets.forEach((listItem, idx) => {
      const isActive = listItem.classList.contains("active");
      if (isActive && idx !== this.listItemTargets - 1) {
        Turbo.visit(this.listItemTargets[idx + 1].href);
      }
    });
  }
  previousFeed() {
    this.listItemTargets.forEach((listItem, idx) => {
      const isActive = listItem.classList.contains("active");
      if (isActive && idx !== 0) {
        Turbo.visit(this.listItemTargets[idx - 1].href);
      }
    });
  }
}
