import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["filterSelect", "readAllForm"];

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
}
