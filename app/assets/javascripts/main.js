$(document).ready(function(){
  $(".slider-content").hide();
  $(".slider").hoverIntent(function(){
    $(".slider-content").slideToggle('slow');
  });
});