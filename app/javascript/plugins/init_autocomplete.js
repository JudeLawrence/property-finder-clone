import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('property_listing_location');
  if (addressInput) {
    places({ container: addressInput });
  }
};
export { initAutocomplete };
