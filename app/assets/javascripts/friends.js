var init_friend_lookup;

init_friend_lookup = function() {
  $('#friend-lookup-form').on('ajax:before', function(event, data, status){
    show_spinner();
  });
  
  $('#friend-lookup-form').on('ajax:after', function(event, data, status){
    hide_spinner();
  });
  
  $('#friend-lookup-form').on('ajax:success', function(event, data, status){
    $('#friend-lookup').replaceWith(data);
    init_friend_lookup();
  });
  
  //Listeners are gone once replace with data is used,
  //so we can call init_friend_lookup() again.
  
  //Handle errors
  $('#friend-lookup-form').on('ajax:error', function(event, xhr, status, error){
    hide_spinner();
    $('#friend-lookup-results').replaceWith(' ');
    $('#friend-lookup-errors').replaceWith('We could not find your friend :( ');
  });
}



$(document).ready(function() {
  init_friend_lookup();
})