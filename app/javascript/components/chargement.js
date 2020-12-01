import anime from 'animejs/lib/anime.es.js';
// const anime = require('animejs');


const loadAnimation = () => {

  const chargement = document.getElementById('js-chargement');

  if (chargement === undefined || chargement === null)
    return

  var loopBegan = 0;
  var loopCompleted = 0;

  anime({
    targets: '#js-chargement',
    translateX: 240,
    loop: true,
    direction: 'alternate',
    easing: 'easeInOutCirc',
    loopBegin: function(anim) {
      loopBegan++;
      chargement.value = 'loop began : ' + loopBegan;
    },
    loopComplete: function(anim) {
      loopCompleted++;
      chargement.value = 'loop completed : ' + loopCompleted;
    }
  });

};

export {
  loadAnimation
};
