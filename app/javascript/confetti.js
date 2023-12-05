import confetti from 'https://cdn.skypack.dev/canvas-confetti';

function makeConfetti(){
  console.log("confetti");
  confetti();
}

document.addEventListener('DOMContentLoaded', (event) => {
  const btn = document.getElementById("confetti-btn");
  btn.addEventListener("click", makeConfetti);
});
