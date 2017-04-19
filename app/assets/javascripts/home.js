$(document).ready(function(){

  $(window).scroll(function() {
      var scroll = $(window).scrollTop();

      if (scroll >= 60) {
          $(".arrow").hide();
      } else {
          $(".arrow").show();
      }
  });

  // $('.onoffswitch-checkbox').click(function(){
  //   if ($('.items-give ').hasClass("hide")) {
  //     // $('.items-give').fadeIn(100);
  //     // $(".items-borrow").fadeOut(100, "linear");
  //     $('.items-borrow ').slideDown();
  //     $('.items-give ').slideUp();
  //     $('.items-give ').removeClass("hide");
  //     $('.items-borrow ').addClass("hide");
  //   }else{
  //     //  $('.items-borrow').fadeIn(100);
  //     // $(".items-give").fadeOut(100, "linear");
  //     $('.items-give ').slideDown();
  //     $('.items-borrow ').slideUp();
  //     $('.items-borrow ').removeClass("hide");
  //     $('.items-give ').addClass("hide");
  //   }
  // });

  $('.onoffswitch-checkbox').click(function(){
    // $('.features ').toggleClass("disabled");
    $('.features').slideToggle();
  });


 setTimeout(function() {
   $('.alert').fadeOut('fast');
 }, 1000);

});


