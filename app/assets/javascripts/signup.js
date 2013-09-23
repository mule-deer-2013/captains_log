// this is poluting the global namespace.
var show_the_modal = function(e){
  e.preventDefault();
  $('.modal').toggle();
}

$(document).ready(function(){
  $('#modal_link').bind('click', show_the_modal);
});
