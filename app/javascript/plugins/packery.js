import { fetchWithToken } from '../utils/fetch_with_token';

const packery = () => {

  const t = document.getElementById("grid-packery");
  if (t) {

    var pckry = new Packery( '.grid', {
        itemSelector: '.grid-item',
        columnWidth: 100
      });

    pckry.getItemElements().forEach( function( itemElem ) {
      var draggie = new Draggabilly( itemElem );
      pckry.bindDraggabillyEvents( draggie );
    });

    const orderItems = () => {
      var elements = pckry.getItemElements();
      elements.forEach((element, i) => {
        var step = {
          id: parseInt(element.dataset.id),
          old_rank: parseInt(element.dataset.rank),
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
              element.firstElementChild.querySelector("#rank").innerText = step.new_rank
          });
        }
      })
    }

    pckry.on( 'dragItemPositioned', orderItems );

  }
}

export { packery };
