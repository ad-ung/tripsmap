// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("src/cocoon")


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
// import "cocoon";
import {location} from "../plugins/location";
import { initMapbox } from '../plugins/init_mapbox';
import { packery } from '../plugins/packery';
import { dropdrownForm } from '../plugins/dropdown_form';
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initMapbox();
  packery();
  location();
  dropdrownForm();
  // const dropdown = document.querySelector(".dropdown button");
  // const elements = document.querySelectorAll(".multi-collapse");
  // elements.forEach ((element) => {
  //   element.addEventListener('click', (event) => {
  //     dropdown.classList.add("collapsed");
  //     elements.forEach(l => l.classList.remove("show"));
  //   });
  // });

});
// app/assets/javascripts/application.js
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require_tree .


// a exporter et importer avec les variables
// let d1 = document.getElementById("d1");
// let d2 = document.getElementById("d2");
// let p1 = document.getElementById("p1");
// let l1 = document.getElementById("l1");
// d1.addEventListener("mouseover", () => {p1.style.display = "block";});
// d1.addEventListener("mouseout", () => {p1.style.display = "none";});


// d2.onmouseover = aff;
// function aff(){
//   l1.style.display = "block";
// }
// d2.onmouseout = cac;
// function cac(){
//   l1.style.display = "none";
// }


