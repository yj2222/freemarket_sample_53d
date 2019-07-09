$(document).on('turbolinks:load', function () {

  var top = $('.category_top');
  var middle = $('.category_middle');
  var bottom = $('.category_bottom');
  var size = $('.size-form');

  var delivery_price = $('.delivery_price');
  var delivery_type = $('.delivery_type');

  //トップカテゴリー
  top.on('change', function () {
    value = $(".category_top--select").val()
    select_top_val = Number(value)
    if (select_top_val == 1){
      middle.removeClass('display-none');
    }
  });

  //ミドルカテゴリー
  middle.on('change', function () {
    value = $(".category_middle--select").val()
    select_middle_val = Number(value)
    if (select_middle_val == 1){
      bottom.removeClass('display-none');
    }
  });

  //ボトムカテゴリー
  bottom.on('change', function () {
    size.removeClass('display-none');
  });

  //配送料の負担
  delivery_price.on('change', function () {
    value = $(".delivery_price_value").val()
    delivery_type.removeClass('display-none');
    if (value == '送料込み（出品者負担）') {
      $(".delivery_1_types").removeClass('display-none');
      $(".delivery_2_types").addClass('display-none');
    } 
    if (value == '着払い（購入者負担）') {
      $(".delivery_2_types").removeClass('display-none');
      $(".delivery_1_types").addClass('display-none');
    }
  });

});