import { Controller } from "stimulus"

export default class extends Controller {
  addTrigger = (e) => {
   let tasks = document.querySelector("#tasks")
   tasks.parentNode.innerHTML = e.detail[0].html_string
  }
}
