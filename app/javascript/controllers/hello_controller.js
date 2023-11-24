import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello World!")
    const notice = document.querySelector(".notice")
    console.log(notice)
    if (notice) {
      setTimeout(() => {
        notice.style.bottom = '16px';
      }, "100");

      setTimeout(() => {
        notice.style.bottom = '-48px';
      }, "5000");

      setTimeout(() => {
        notice.classList.add("d-none")
      }, "8000");

    }
  }
}
