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

connect() {console.log("connected_newmot")}

  createMot = (e) => {
    fetch(`/mots/new`, { headers: {
    "Content-Type": "application/json"
  }})
      .then(response => response.json())
      .then((data) => {
         let wrapper = document.querySelector("#wrappernewmot")
          wrapper.innerHTML = data.html_string
          document.querySelectorAll(".active-side-bar").forEach ((div) => div.classList.remove("active-side-bar"))
          e.target.parentNode.parentNode.parentNode.classList.add("active-side-bar")
      });
  }
}
