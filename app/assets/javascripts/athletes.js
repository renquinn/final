// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$('#post_league').live('change', function() {
  console.log('test');
  $('#league_form').submit();
});
