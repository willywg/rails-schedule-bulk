document.addEventListener('turbolinks:load', () => {
  const addButtons = document.getElementsByClassName('add-hour-button');

  const addHourHandle = (e) => {
    e.preventDefault();
    const key = e.currentTarget.getAttribute('data-key');
    const hourToClone = document.getElementsByClassName(`hour-field-${key}`)[0];
    const clonedHour = hourToClone.cloneNode(true);
    clonedHour.firstElementChild.value = ""

    hourToClone.parentNode.appendChild(clonedHour);
  }
  
  // hasTransport.addEventListener('click', handleHasTransport);
  for (const addButton of addButtons) {
    addButton.addEventListener('click', addHourHandle);
  }
});