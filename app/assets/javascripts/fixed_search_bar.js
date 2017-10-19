$(document).ready(function() {

  // Prevent collision between footer and searchbar
  var height = 0;
  function checkOffsetSearchBar() {
    if ($('.ceramique-filters-content').length > 0) {
      if ($('.list-header-1').length > 0 || $('.list-header-2').length > 0) {
        if($('.ceramique-filters-content').offset().top + $('.ceramique-filters-content').height() >= $('#footer').offset().top - 10) {
          $('.ceramique-filters-content').css('position', 'absolute');
          $('.ceramique-filters-content').css({"top": (height.toString()+"px")})
          }
        if($(document).scrollTop() + window.innerHeight < $('#footer').offset().top) {
          $('.ceramique-filters-content').css('position', 'fixed'); // restore when you scroll up
          $('.ceramique-filters-content').css({"top": ""})
          height = $(document).scrollTop();
        }
      }
    }
  }

  $(document).scroll(function() {
    checkOffsetSearchBar();
  });
})
