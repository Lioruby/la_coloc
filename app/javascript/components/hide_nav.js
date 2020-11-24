const hiddenNav = () => {
  let hideItem = document.getElementById("myLinks");
  hideItem.classList.toggle('hidden')
}


const clickOnBurger = () => {
  document.getElementById('burger').addEventListener('click', (e) => {
    hiddenNav();
  })
};

export {
  clickOnBurger
};
