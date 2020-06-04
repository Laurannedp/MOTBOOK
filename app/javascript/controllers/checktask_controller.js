// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus";

export default class extends Controller {
static targets = [ "wrapper" ]

connect() {console.log("connected_checktask")}

  checkboxTask = (e) => {
    let motId = e.target.dataset.motId
    let taskId = e.target.dataset.taskId
    fetch(`/mots/${motId}/tasks/${taskId}/check`, { headers: {
    "Content-Type": "application/json"
  }})
      .then(response => response.json())
      .then((data) => {
         let wrapper = this.wrapperTarget
         wrapper.innerHTML = data.html_string2
         let wrappermot = document.querySelector("#wrappernewmot")
         if (wrappermot) {
          wrappermot.innerHTML = data.html_string
         }
      });
  }
}

