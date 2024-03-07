import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["filterSelect", "readAllForm", "navigationItem", "search"];

  // 1, 2, 3
  selectAll(e) {
    if (this.shouldIgnore(e)) return;
    this.selectFilter(0);
  }
  selectUnread(e) {
    if (this.shouldIgnore(e)) return;
    this.selectFilter(1);
  }
  selectStarred(e) {
    if (this.shouldIgnore(e)) return;
    this.selectFilter(2);
  }
  selectFilter(index) {
    this.filterSelectTarget.selectedIndex = index;
    this.filterSelectTarget.form.requestSubmit();
  }

  // shift+r
  readAll(e) {
    if (this.shouldIgnore(e)) return;
    this.readAllFormTarget.requestSubmit();
  }

  // f, b
  scrollContentDown(e) {
    if (this.shouldIgnore(e)) return;
    window.scrollBy(0, 200);
  }
  scrollContentUp(e) {
    if (this.shouldIgnore(e)) return;
    window.scrollBy(0, -200);
  }

  // h, l
  nextFeed(e) {
    if (this.shouldIgnore(e)) return;
    this.navigationItemTargets.forEach((navigationItem, idx) => {
      const isActive = navigationItem.classList.contains("active");
      if (isActive && idx !== this.navigationItemTargets.length - 1) {
        Turbo.visit(this.navigationItemTargets[idx + 1].href);
      }
    });
  }
  previousFeed(e) {
    if (this.shouldIgnore(e)) return;
    this.navigationItemTargets.forEach((navigationItem, idx) => {
      const isActive = navigationItem.classList.contains("active");
      if (isActive && idx !== 0) {
        Turbo.visit(this.navigationItemTargets[idx - 1].href);
      }
    });
  }

  // j, k, o
  nextItem(e) {
    if (this.shouldIgnore(e)) return;
    this.dispatch("nextItem");
  }
  previousItem(e) {
    if (this.shouldIgnore(e)) return;
    this.dispatch("previousItem");
  }
  toggleItem(e) {
    if (this.shouldIgnore(e)) return;
    this.dispatch("toggleItem");
  }

  // r, s
  toggleRead(e) {
    if (this.shouldIgnore(e)) return;
    this.dispatch("toggleRead");
  }
  toggleStarred(e) {
    if (this.shouldIgnore(e)) return;
    this.dispatch("toggleStarred");
  }

  // o
  openLink(e) {
    if (this.shouldIgnore(e)) return;
    this.dispatch("openLink");
  }

  // slash (/)
  focusSearch(e) {
    e.preventDefault();
    this.searchTarget.focus();
  }

  shouldIgnore(e) {
    return this.isTextBox(e.target) || e.metaKey || e.ctrlKey || e.altKey;
  }

  isTextBox(element) {
    var tagName = element.tagName.toLowerCase();
    // Input elements that aren't text
    var inputBlocklist = [
      "button",
      "checkbox",
      "color",
      "file",
      "hidden",
      "image",
      "radio",
      "range",
      "reset",
      "search",
      "submit",
    ];

    return (
      tagName === "textarea" ||
      (tagName === "input" &&
        inputBlocklist.indexOf(element.getAttribute("type").toLowerCase()) ==
          -1)
    );
  }
}
