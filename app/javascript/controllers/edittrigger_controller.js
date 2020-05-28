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

connect() {console.log("connected_triggeredit")}

  editTrigger = () => {
    let motId = this.element.dataset.motId
    let taskId = this.element.dataset.taskId
    let triggerId = this.element.dataset.triggerId
    fetch(`/mots/${motId}/tasks/${taskId}/triggers/${triggerId}/edit`, { headers: {
    "Content-Type": "application/json"
  }})
      .then(response => response.json())
      .then((data) => {
         let wrapper = this.wrapperTarget
          wrapper.innerHTML = data.html_string
      });
  }
}
