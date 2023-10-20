import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="auth-form"
export default class extends Controller {
  static targets = ["loginView", "signUpView", "login", "username", "email"];
  static values = {
    login: String,
    username: String,
    email: String,
  };

  connect() {
    this.element.addEventListener(
      "turbo:frame-render",
      console.log("frame changed")
    );
    // document.addEventListener("turbo:frame-load", console.log("frame changed"));
  }

  toggle() {
    this.loginViewTarget.classList.toggle("hidden");
    this.signUpViewTarget.classList.toggle("hidden");
    // alert("hi");
  }

  bind(e) {
    const target = e.target.getAttribute("data-auth-form-target");
    // console.log(this.loginTarget.value);
    this[target + "Value"] = this[target + "Target"].value;
    this.updateViews();
    // console.log(this[target + "Value"]);
  }

  updateViews() {
    // console.log("ipdajm");
    this.usernameTarget.value = this.loginValue;
  }
}
