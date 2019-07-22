$(function(){
  $('.products__change__box__delete--btn').on('click', function(){
    var w = $(window).width();
    var h = $(window).height();
    var cw = $("#modal").outerWidth();
    var ch = $("#modal").outerHeight();
    //取得した値をcssに追加する
    $("#modal").css({
      "margin": ((h-ch)/2) + "auto"
    });
   console.log("ok")
   $('#overlay').fadeIn();
   $('#modal').fadeIn();
 });

  $('#modal_cancel').on('click', function(){
    $('#overlay').fadeOut();
    $('#modal').fadeOut();
  });
  $('#overlay').on('click', function(){
    $('#overlay').fadeOut();
    $('#modal').fadeOut();
  });
});
