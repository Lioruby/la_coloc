const hiddenNav = () => {
  let hideItem = document.getElementById("myLinks");
  hideItem.classList.toggle('hidden')
}


const clickOnBurger = () => {
  document.querySelector('button').addEventListener('click', (e) => {
    hiddenNav();
  })
};

export {
  clickOnBurger
};
