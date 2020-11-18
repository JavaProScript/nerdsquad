// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { toggleVisibility } from "../plugins/toggleVisibility"
import { moveAround } from "../plugins/moveAround"
import { dice } from '../components/dice';
import { initGameroomCable } from "../channels/gameroom_channel";
const positionElement = () => { 
  document.querySelectorAll(".movablecontainer").forEach((div) => {
    console.log(div);
    let xPos = div.dataset.posx
    let yPos = div.dataset.posy
    div.style.transform = "translate3d(" + xPos + "px, " + yPos + "px, 0)";
  })
}
document.addEventListener('turbolinks:load', () => {
  moveAround();
  dice;
  initGameroomCable();
  positionElement();
});
