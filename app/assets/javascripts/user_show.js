
$(document).ready(function() {

  // Prevent collision between footer and slider
  var height = 0;
  function checkOffset() {
    if($('#slider').length > 0) {
      if($('#slider').offset().top + $('#slider').height() >= $('#footer').offset().top - 10) {
        $('#slider').css('position', 'absolute');
        $('#slider').css({"top": (height.toString()+"px")})
        }
      if($(document).scrollTop() + window.innerHeight < $('#footer').offset().top) {
        $('#slider').css('position', 'fixed'); // restore when you scroll up
        $('#slider').css({"top": ""})
        height = $(document).scrollTop() + window.innerHeight - 107 - 91 - 124;
      }
    }
  }

  // Manage contact-button position
  function changeButton() {
    if ($('#contactbutton').length > 0) {
      if($(document).scrollTop() > $('#anchor-info').offset().top + 20) {

        $('#contactbutton').css({
          position: 'fixed',
          top: 20,
          right: 30
        });
      } else {
        $('#contactbutton').css({
          position: '',
          top: '',
          right: -25
        });
      }
    }
  }

  function changeButtonMobile() {
    if($(document).scrollTop() > $('#anchor-info').offset().top) {
      $('#contactbutton-mobile').css({
        position: 'fixed',
        top: 0,
        left: 0,
        zIndex: 1
      });
      $('.bottom-info').css({marginTop: 50});
    } else {
      $('#contactbutton-mobile').css({
        position: '',
        top: '',
        zIndex: 0
      });
      $('.bottom-info').css({marginTop: 0});
    }
  }

  $(document).scroll(function() {
    checkOffset();
    changeButton();
    changeButtonMobile();
  });


  //Input display/hide on click
  $('.add-photo0, .add-photo1, .add-photo2, .add-photo3, .add-photo4, .add-photo5').on('click', function(e) {
    var clickedElement = $(e.target).text().trim();
    switch (clickedElement){
      case "Image d'accueil":
        $('.input0').removeClass('hidden').focus();
        $('.add-photo0').css({'border-bottom-left-radius':0});
        $('.add-photo0').css({'border-bottom-right-radius':0});

        $('.input1, .input2, .input3, .input4, .input5').addClass('hidden').val();
        $('.add-photo1, .add-photo2, .add-photo3, .add-photo4, .add-photo5').css({'border-bottom-left-radius':3});
        $('.add-photo1, .add-photo2, .add-photo3, .add-photo4, .add-photo5').css({'border-bottom-right-radius':3});
        break;
      case "Photo pour la page bio":
        $('.input1').removeClass('hidden').focus();
        $('.add-photo1').css({'border-bottom-left-radius':0});
        $('.add-photo1').css({'border-bottom-right-radius':0});

        $('.input0, .input2, .input3, .input4, .input5').addClass('hidden').val();
        $('.add-photo0, .add-photo2, .add-photo3, .add-photo4, .add-photo5').css({'border-bottom-left-radius':3});
        $('.add-photo0, .add-photo2, .add-photo3, .add-photo4, .add-photo5').css({'border-bottom-right-radius':3});
        break;
      case "Image d'accueil pour mobiles":
        $('.input2').removeClass('hidden').focus();
        $('.add-photo2').css({'border-bottom-left-radius':0});
        $('.add-photo2').css({'border-bottom-right-radius':0});

        $('.input0, .input1, .input3, .input4, .input5').addClass('hidden').val();
        $('.add-photo0, .add-photo1, .add-photo3, .add-photo4, .add-photo5').css({'border-bottom-left-radius':3});
        $('.add-photo0, .add-photo1, .add-photo3, .add-photo4, .add-photo5').css({'border-bottom-right-radius':3});
        break;
      case "Image pour les stages":
        $('.input3').removeClass('hidden').focus();
        $('.add-photo3').css({'border-bottom-left-radius':0});
        $('.add-photo3').css({'border-bottom-right-radius':0});

        $('.input0, .input1, .input2, .input4, .input5').addClass('hidden').val();
        $('.add-photo0, .add-photo1, .add-photo2, .add-photo4, .add-photo5').css({'border-bottom-left-radius':3});
        $('.add-photo0, .add-photo1, .add-photo2, .add-photo4, .add-photo5').css({'border-bottom-right-radius':3});
        break;
      case "Image pour votre ville":
        $('.input4').removeClass('hidden').focus();
        $('.add-photo4').css({'border-bottom-left-radius':0});
        $('.add-photo4').css({'border-bottom-right-radius':0});

        $('.input0, .input1, .input2, .input3, .input5').addClass('hidden').val();
        $('.add-photo0, .add-photo1, .add-photo2, .add-photo3, .add-photo5').css({'border-bottom-left-radius':3});
        $('.add-photo0, .add-photo1, .add-photo2, .add-photo3, .add-photo5').css({'border-bottom-right-radius':3});
        break;
      case "Image pour votre logo":
        $('.input5').removeClass('hidden').focus();
        $('.add-photo5').css({'border-bottom-left-radius':0});
        $('.add-photo5').css({'border-bottom-right-radius':0});

        $('.input0, .input1, .input2, .input3, .input4').addClass('hidden').val();
        $('.add-photo0, .add-photo1, .add-photo2, .add-photo3, .add-photo4').css({'border-bottom-left-radius':3});
        $('.add-photo0, .add-photo1, .add-photo2, .add-photo3, .add-photo4').css({'border-bottom-right-radius':3});
        break;
    }
  });

  $(document).on('click', function(e) {
    $('.input0, .input1, .input2, .input3, .input4, .input5').addClass('hidden').val();
    $('.add-photo').css({'border-bottom-left-radius':3});
    $('.add-photo').css({'border-bottom-right-radius':3});
  });

  $('#card0, #card1, #card2, #card3, #card4, #card5').click(function(event){
     event.stopPropagation();
 });

  //Attachinary customizaton
  //1 - Remove input
  $('#user_productphoto').on('click', function(e) {
    e.stopPropagation();
    $('#user_productphoto').addClass('hidden').focus();
  });
  $('#user_avatarphoto').on('click', function(e) {
    e.stopPropagation();
    $('#user_avatarphoto').addClass('hidden').focus();
  });
  $('#user_productphotomobile').on('click', function(e) {
    e.stopPropagation();
    $('#user_productphotomobile').addClass('hidden').focus();
  });
  $('#user_lessonphoto').on('click', function(e) {
    e.stopPropagation();
    $('#user_lessonphoto').addClass('hidden').focus();
  });
  $('#user_cityphoto').on('click', function(e) {
    e.stopPropagation();
    $('#user_cityphoto').addClass('hidden').focus();
  });
  $('#user_logophoto').on('click', function(e) {
    e.stopPropagation();
    $('#user_logophoto').addClass('hidden').focus();
  });

  //2 - Add input on clic
  $('.input0').on('click', function(e) {
    $('#user_productphoto').removeClass('hidden').val();
  });
  $('.input1').on('click', function(e) {
    $('#user_avatarphoto').removeClass('hidden').val();
  });
  $('.input2').on('click', function(e) {
    $('#user_productphotomobile').removeClass('hidden').val();
  });
  $('.input3').on('click', function(e) {
    $('#user_lessonphoto').removeClass('hidden').val();
  });
  $('.input4').on('click', function(e) {
    $('#user_cityphoto').removeClass('hidden').val();
  });
  $('.input5').on('click', function(e) {
    $('#user_logophoto').removeClass('hidden').val();
  });
})
