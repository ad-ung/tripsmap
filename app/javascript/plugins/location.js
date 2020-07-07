const location = () => {
  var places = require('places.js');
  var placesAutocomplete = places({
    appId: 'plOL5BSR7XQ3',
    apiKey: '06ed3942681591fbb477fe61a64cb1e2',
    container: document.getElementById('place-address')
});

}

export {location}
