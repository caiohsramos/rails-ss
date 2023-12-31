import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form"];
  static values = {
    itemStatus: String,
  };
  submitForm(e) {
    if (e.target.open && this.itemStatusValue === "unread") {
      this.formTarget.requestSubmit();
    }
  }
}
