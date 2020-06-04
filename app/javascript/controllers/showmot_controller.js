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

renderMot = (e) => {
    let motId = this.element.dataset.motId
    fetch(`/mots/${motId}`, { headers: {
    "Content-Type": "application/json"
  }})
      .then(response => response.json())
      .then((data) => {
         let wrapper = document.querySelector("#wrappernewmot")
          wrapper.innerHTML = data.html_string
          document.querySelectorAll(".active-side-bar").forEach ((div) => div.classList.remove("active-side-bar"))
          e.target.parentNode.parentNode.parentNode.classList.add("active-side-bar")
          $('[data-toggle="tooltip"]').tooltip()
      });
  }
}

