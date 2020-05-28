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

renderMot = () => {
    let motId = this.element.dataset.motId
    fetch(`/mots/${motId}`, { headers: {
    "Content-Type": "application/json"
  }})
      .then(response => response.json())
      .then((data) => {
         let wrapper = document.querySelector("#wrappermot")
          wrapper.innerHTML = data.html_string
      });
  }
}

