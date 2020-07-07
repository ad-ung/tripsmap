// import mapboxgl from 'mapbox-gl';

// const initMapbox = () => {
//   const mapElement = document.getElementById('map');

//   if (mapElement) { // only build a map if there's a div#map to inject into
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//     const map = new mapboxgl.Map({
//       container: 'map',
//       style: 'mapbox://styles/mapbox/streets-v11',
//       center: [-74.5, 40],
//       zoom: 100
//     });
//     map.addControl(new mapboxgl.NavigationControl());
//     const markers = JSON.parse(mapElement.dataset.markers);
//       console.log(markers)
//       markers.forEach((marker) => {
//         new mapboxgl.Marker()
//           .setLngLat([ marker.lng, marker.lat ])
//           .addTo(map);
//   });
//     fitMapToMarkers(map, markers);
//   }
// };

// const fitMapToMarkers = (map, markers) => {
//   const bounds = new mapboxgl.LngLatBounds();
//   markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//   map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
// };

// export { initMapbox };

import mapboxgl from 'mapbox-gl';

const profileMapElement = document.getElementById('profile-map');

const stepMapElement = document.getElementById('step-map');

const buildProfileMap = () => {
  mapboxgl.accessToken = profileMapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'profile-map',
    style: 'mapbox://styles/alexandrelem/ckc7ginr9142d1ioop9u9532y'

  });
};

const buildStepMap = () => {
  mapboxgl.accessToken = stepMapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'step-map',
    style: 'mapbox://styles/alexandrelem/ckc7ginr9142d1ioop9u9532y'

  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('https://res.cloudinary.com/datbhgbcq/image/upload/v1593879728/TRIPSMAP/Plane_gsg74i.png')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '50px';
    element.style.height = '50px';

    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const line = (map, trip) => {
  const colors = ["#888", "#f69e7b", "#12cad6"]
    map.addSource(`${trip[0].id}`, {
            'type': 'geojson',
            'data': {
                'type': 'Feature',
                'properties': {},
                'geometry': {
                    'type': 'LineString',
                    'coordinates': trip.map(marker => [marker.lng, marker.lat])
                }
            }
        });
        map.addLayer({
            'id': `${trip[0].id}`,
            'type': 'line',
            'source': `${trip[0].id}`,
            'layout': {
                'line-join': 'round',
                'line-cap': 'round'
            },
            'paint': {
                'line-color': colors[trip[0].id-1],
                'line-width': 8
            }
        });
}

const initMapbox = () => {

  if (profileMapElement) {
    const map = buildProfileMap();
    const trips = JSON.parse(profileMapElement.dataset.markers);
    trips.forEach((trip) => {
      addMarkersToMap(map, trip);
      fitMapToMarkers(map, trip);
    })

    map.on('load', function() {
      trips.forEach((trip) => {
        line(map, trip);
      })
    })
  } else if (stepMapElement) {
    const map = buildStepMap();
    const marker = JSON.parse(stepMapElement.dataset.marker);

    addMarkersToMap(map, marker);
    fitMapToMarkers(map, marker);
    console.log(map);
  }
  map.addControl(new mapboxgl.FullscreenControl());
  map.addControl(new mapboxgl.NavigationControl());
    // console.log(markers.map(marker => [marker.lat, marker.lng]));
}

export { initMapbox };
