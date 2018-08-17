$(document).on('turbolinks:load', function() {
    $('.date_picker').datepicker({format: 'yyyy-mm-dd'});
    $('.time_picker').timepicker();
});
