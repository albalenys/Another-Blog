$(document).ready(function(){
  $("#slider-content").hide();
  $(".slider").click(function(){
    $("#slider-content").slideToggle('slow');
  });
});