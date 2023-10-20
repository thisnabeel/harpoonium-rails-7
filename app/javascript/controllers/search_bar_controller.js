import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    // this.element.textContent = "Hello World!";
  }

  hide(e) {
    // alert(e.target);
    setTimeout(function () {
      document.getElementById("chapters-sample").innerHTML = "";
    }, 1000);
  }
}
