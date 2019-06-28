$(document).on('turbolinks:load', function () {
  $("#textForm1").keyup(function(){
    var str = $(this).val();
    var tax = Math.floor(str * 0.1)
    $('.price__list__tax--right').text("¥" + tax);
    var total = str - tax
    var num = String(total).replace(/(\d)(?=(\d\d\d)+$)/g, "$1,");
    $('.price__list__profit--right').text("¥" + num);
  });
});

