$(document).on('turbolinks:load', function () {
  $('.exhibition').submit(function() {
    var brand = $('.brand_box_val').val();
    if (brand == "シャネル") {
      $('.brand_box_val').val(1);
    } 
    if (brand == "ルイヴィトン") {
      $('.brand_box_val').val(2);
    } 
    if (brand == "シュプリーム") {
      $('.brand_box_val').val(3);
    } 
    if (brand == "ナイキ") {
      $('.brand_box_val').val(4);
    }
  });
});