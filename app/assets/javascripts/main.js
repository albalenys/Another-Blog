$(document).ready(function(){
  $("a.fancybox").fancybox();

  $(".fancybox-form").submit(function(event) {
    parent.$.fancybox.close();
  });

  $(".slider-content").hide();
  $(".slider").hoverIntent(function(){
    $(".slider-content").slideToggle('slow');
  });
});