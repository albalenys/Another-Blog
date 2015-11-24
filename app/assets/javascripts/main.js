$(document).ready(function(){
  $("a.fancybox").fancybox();

  $(".fancybox-form").submit(function(event) {
    parent.$.fancybox.close();
    self.parent.location.href = "/";
  });

  $(".slider-content").hide();
  $(".slider").hoverIntent(function(){
    $(".slider-content").slideToggle('slow');
  });
});