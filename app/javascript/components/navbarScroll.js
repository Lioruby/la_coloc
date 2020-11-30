const scrollNav = () => {
  let prevScrollpos = window.pageYOffset;

  window.onscroll = function() {
    let currentScrollPos = window.pageYOffset;
    if (prevScrollpos > currentScrollPos) {
      document.getElementById("topnav").style.top = "0";
    } else {
      document.getElementById("topnav").style.top = "-50px";
    }
    prevScrollpos = currentScrollPos;
  }
}

export default scrollNav;
