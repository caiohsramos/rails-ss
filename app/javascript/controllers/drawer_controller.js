import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["unreadList", "drawerInput", "drawerLabel"];

  contentLoaded() {
    this.unreadListTarget.reload();
    if (this.drawerInputTarget.value == "on") {
      this.drawerLabelTarget.click();
    }
  }
}
