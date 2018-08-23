$(document).ready(function() {
  if ($('.front-image-div').length > 0) {
    $('.overlay-ok').on('click', function(e) {
      $('.imageoverlay').css("display", "none");
      $('.img-front').css("filter", "brightness(100%)");
    });
  }
  if ($('.overlay').length > 0) {
    $('.overlay-button').on('click', function(e) {
      $('.overlay').css("display", "none");
    });
  }
});
