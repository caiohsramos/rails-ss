import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input"];

  clear() {
    Turbo.visit(window.location.pathname, {
      action: "replace",
      frame: "content",
    });
    this.inputTarget.value = "";
  }

  query(e) {
    e.preventDefault();
    const params = new URLSearchParams({
      q: this.inputTarget.value,
    });
    Turbo.visit(`${window.location.pathname}?${params}`, {
      action: "replace",
      frame: "content",
    });
  }
}
