
$(document).on('turbolinks:load', function() {
    $(function() {
        let mapsOrigin = document.getElementById('maps_origin');
        new google.maps.places.Autocomplete(mapsOrigin);

        let mapsDestination = document.getElementById('maps_destination');
        new google.maps.places.Autocomplete(mapsDestination);
    });
});
