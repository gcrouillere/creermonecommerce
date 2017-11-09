$(document).ready(function() {
  $('.cross-1, .cross-mobile').on('click', function(e) {
    $('.list-header-1').remove();
    $('.h1-home-2').remove();
  });
  $('.cross-2 ').on('click', function(e) {
    $('.h1-home').remove();
    $('.h1-home-mobile').remove();
    $('.list-header-2').remove();
  });
});
