// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus";
import Rails from "@rails/ujs";
export default class extends Controller {
static targets = [ "wrapper" ]

connect() {console.log("connected_edittask")}

  editTask = () => {
    let motId = this.element.dataset.motId
    let taskId = this.element.dataset.taskId
    fetch(`/mots/${motId}/tasks/${taskId}/edit`, { headers: {
    "Content-Type": "application/json"
  }})
      .then(response => response.json())
      .then((data) => {
         let wrapper = this.wrapperTarget
          wrapper.innerHTML = data.html_string
      });
  }
  destroyTask() {
    console.log("destroyingtask")
    let motId = this.element.dataset.motId
    let taskId = this.element.dataset.taskId
     fetch(`/tasks/${taskId}`, {
      method: 'DELETE',
      headers: {"X-CSRF-Token": Rails.csrfToken(),"Content-Type": "application/json"}
    })
      .then(response => response.json())
      .then((data) => {
        let wrapper = document.querySelector("#wrappernewmot")
        wrapper.innerHTML = data.html_string
      });
  }
}
