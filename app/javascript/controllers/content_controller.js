import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  loaded() {
    document.getElementById("unread_list").reload();
  }
}
