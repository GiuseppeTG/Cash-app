

function mobileMenu() {
  const hamburger = document.querySelector('.hamburger')
  const hamburgerClose = document.querySelector('.hamburger-close')
  const navLinks = document.querySelector('.nav-links')

  hamburger.addEventListener('click', () => {
    hamburger.classList.toggle('active');
    hamburgerClose.classList.toggle('active');
    navLinks.classList.toggle('active');
  });
  
  hamburgerClose.addEventListener('click', () => {
    hamburger.classList.toggle('active');
    hamburgerClose.classList.toggle('active');
    navLinks.classList.toggle('active');
  });
  
  document.querySelectorAll('.nav-link').forEach((n) => n.addEventListener('click', () => {
    hamburger.classList.toggle('active');
    hamburgerClose.classList.toggle('active');
    navLinks.classList.toggle('active');
  }));

}

window.onload = () => {
  mobileMenu()
}