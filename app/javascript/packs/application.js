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
import '../stylesheets/application.scss';
import { clickOnBurger } from '../components/hide_nav'
import initTabs from '../components/home_tabs'
import "controllers"
import dynamicCalendar from '../components/calendar'
import scrollNav from '../components/navbarScroll'
import { loadAnimation } from '../components/chargement'
import { bestRoomateChart } from '../components/chart'
import { tasksChart } from '../components/task_chart'

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  clickOnBurger();

  // initTabs();
  dynamicCalendar();

  // scrollNav();

  //Chargement invitation
  loadAnimation();

  //chargement du graphique du travail des joueurs en minutes
  bestRoomateChart();

  //chargement du graphique des tâches en détails
  tasksChart();

});

