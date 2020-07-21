import { fetchWithToken } from '../utils/fetch_with_token';

const packery = () => {

  const dragButton = document.getElementById("reorganize-button");
  const t = document.getElementById("grid-packery");

  if (dragButton) {

    var pckry = new Packery( '.grid', {
        itemSelector: '.grid-item',
        columnWidth: 100
    });

    var draggies = [];
    pckry.getItemElements().forEach( function( itemElem ) {
      var draggie = new Draggabilly( itemElem );
      pckry.bindDraggabillyEvents( draggie );
      draggies.push(draggie);
      draggie.disable();
      draggie.unbindHandles();
    });

    dragButton.addEventListener('click', (event) => {
      dragButton.classList.toggle("drag");
      if (dragButton.classList.contains("drag")) {
        for (var i = 0; i < draggies.length; i++) {
          draggies[i].enable();
          draggies[i].bindHandles();
        }
      } else {
        for (var i = 0; i < draggies.length; i++) {
          draggies[i].disable();
          draggies[i].unbindHandles();
        }
      }
    })

    const orderItems = () => {
      var elements = pckry.getItemElements();
      elements.forEach((element, i) => {
        var step = {
          id: parseInt(element.dataset.id),
          old_rank: parseInt(element.firstElementChild.querySelector("#rank").innerText),
          new_rank: i + 1
        };
        if (step.old_rank !== step.new_rank) {
          fetchWithToken(`/steps/${step.id}`, {
            method: "PATCH",
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json"
            },
            body: JSON.stringify({ step: { id_in_its_trip: step.new_rank }})
          })
            .then(response => response.json())
            .then((data) => {
              element.firstElementChild.querySelector("#rank").innerText = data.id_in_its_trip
          });
        }
      })
    }

    pckry.on( 'dragItemPositioned', orderItems );

  }
}

export { packery };
