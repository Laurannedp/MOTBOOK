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


connect() {console.log("connected_newtask")}

  editTask = () => {
    let motId = this.element.dataset.motId
    let taskId = this.element.dataset.taskId
    fetch(`/mots/${motId}/tasks/${taskId}/edit`, { headers: {
    "Content-Type": "application/json"
  }})
      .then(response => response.json())
      .then((data) => {
         let wrapper = document.querySelector("#wrappernewtask")
          wrapper.innerHTML = data.html_string
      });
  }
}
