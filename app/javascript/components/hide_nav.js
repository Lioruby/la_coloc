const hiddenNav = () => {
  let hideItem = document.getElementById("myLinks");

  if (hideItem == null)
    return

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
