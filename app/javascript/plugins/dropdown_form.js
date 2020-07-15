const dropdrownForm = () => {
  const form = document.getElementById("formnew");
  if (form) {
    const dropdown = document.querySelector(".dropdown button");
    const elements = document.querySelectorAll(".multi-collapse");
    elements.forEach ((element) => {
      element.addEventListener('click', (event) => {
        dropdown.classList.add("collapsed");
        elements.forEach(l => l.classList.remove("show"));
      });
    });
  }
}

export { dropdrownForm }
