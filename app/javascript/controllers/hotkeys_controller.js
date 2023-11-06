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
      if (isActive && idx !== this.listItemTargets.length - 1) {
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

  // j, k, o
  nextItem() {
    this.dispatch("nextItem");
  }
  previousItem() {
    this.dispatch("previousItem");
  }
  toggleItem() {
    this.dispatch("toggleItem");
  }

  // r, s
  toggleRead() {
    this.dispatch("toggleRead");
  }
  toggleStarred() {
    this.dispatch("toggleStarred");
  }

  // o
  openLink() {
    this.dispatch("openLink");
  }
}
