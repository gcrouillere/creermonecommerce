$(document).ready(function() {

  function changeButtonFixeNav() {
    if($('.ceramique-filters-content').size() > 0) {
      if($(document).scrollTop() > $('.ceramique-list').offset().top) {
        $('.ceramique-filters-content').css({
          position: 'fixed',
          top: 70,
        });
      } else {
        $('.ceramique-filters-content').css({
          position: '',
          top: '',
        });
      }
    }
  }

  function changeButton() {
    if($('.ceramique-filters-content').size() > 0) {
      if($(document).scrollTop() > $('.ceramique-list').offset().top) {
        $('.ceramique-filters-content').css({
          position: 'fixed',
          top: 20,
        });
      } else {
        $('.ceramique-filters-content').css({
          position: '',
          top: '',
        });
      }
    }
  }

  $(document).scroll(function() {
    changeButton();
    // changeButtonFixeNav();
  });
})
