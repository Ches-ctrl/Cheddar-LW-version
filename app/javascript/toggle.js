document.addEventListener('DOMContentLoaded', () => {
  const hideButton = document.getElementById('hide-lhs-button');
  const lhsSection = document.getElementById('jobs-index-left-section');

  hideButton.addEventListener('click', () => {
    lhsSection.classList.toggle('d-none');
  });
});
