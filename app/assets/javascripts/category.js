$(document).on('turbolinks:load', function () {
  
  var delivery_price = $('.delivery_price');
  var delivery_type = $('.delivery_type');

  function build_new_select_tag_1(id) {
    var html = `<div class="select-form__type1">
                  <select name="product[delivery_type]" id="product_delivery_type" class="delivery_type_${id}">
                    <option value="">---</option>
                    <option value="未定">未定</option>
                    <option value="らくらくメルカリ便">らくらくメルカリ便</option>
                    <option value="ゆうメール">ゆうメール</option>
                    <option value="レターパック">レターパック</option>
                    <option value="普通郵便(定形、定形外)">普通郵便(定形、定形外)</option>
                    <option value="クロネコヤマト">クロネコヤマト</option>
                    <option value="ゆうパック">ゆうパック</option>
                    <option value="クリックポスト">クリックポスト</option>
                    <option value="ゆうパケット">ゆうパケット</option>
                  </select>
                </div>`
    return html;
  }

  function build_new_select_tag_2(id) {
    var html = `<div class="select-form__type2">
                  <select name="product[delivery_type]" id="product_delivery_type" class="delivery_type_${id}">
                    <option value="">---</option>
                    <option value="未定">未定</option>
                    <option value="クロネコヤマト">クロネコヤマト</option>
                    <option value="ゆうパック">ゆうパック</option>
                    <option value="ゆうメール">ゆうメール</option>
                  </select>
                </div>`
    return html;
  }

  //トップカテゴリー
  var top = $('.category_top');
  var middle_1 = $('.category_middle_1');
  var middle_2 = $('.category_middle_2');
  var middle_3 = $('.category_middle_3');
  var middle_4 = $('.category_middle_4');

  top.on('change', function () {
    for (var i=1; i<5; i++) {
      var middle = ".category_middle_" + i
      var bottom = ".category_bottom_" + i
      $(middle).removeClass('display-none');
      $(bottom).removeClass('display-none');
      $(bottom).addClass('display-none');
    }
    value = $(".category_top").children().val()
    select_top_val = Number(value)
    if (select_top_val == 1){
      middle_2.addClass('display-none');
      middle_3.addClass('display-none');
      middle_4.addClass('display-none');
    }
    if (select_top_val == 2){
      middle_1.addClass('display-none');
      middle_3.addClass('display-none');
      middle_4.addClass('display-none');
    }
    if (select_top_val == 3){
      middle_1.addClass('display-none');
      middle_2.addClass('display-none');
      middle_4.addClass('display-none');
    }
    if (select_top_val == 4){
      middle_1.addClass('display-none');
      middle_2.addClass('display-none');
      middle_3.addClass('display-none');
    }
  });

  //ミドルカテゴリー
  var bottom_1 = $('.category_bottom_1');
  var bottom_2 = $('.category_bottom_2');
  var bottom_3 = $('.category_bottom_3');
  var bottom_4 = $('.category_bottom_4');

  middle_1.on('change', function () {
    value = $(this).children().val()
    select_middle_val = Number(value)
    if (select_middle_val == 1){
      bottom_1.removeClass('display-none');
    }
  });
  middle_2.on('change', function () {
    value = $(this).children().val()
    select_middle_val = Number(value)
    if (select_middle_val == 1){
      bottom_2.removeClass('display-none');
    }
  });
  middle_3.on('change', function () {
    value = $(this).children().val()
    select_middle_val = Number(value)
    if (select_middle_val == 1){
      bottom_3.removeClass('display-none');
    }
  });
  middle_4.on('change', function () {
    value = $(this).children().val()
    select_middle_val = Number(value)
    if (select_middle_val == 1){
      bottom_4.removeClass('display-none');
    }
  });

  //ボトムカテゴリー
  var size = $('.size-form');

  bottom_1.on('change', function () {
    size.removeClass('display-none');
    $('.error_message.type4').text("");
  });
  bottom_2.on('change', function () {
    size.removeClass('display-none');
    $('.error_message.type4').text("");
  });
  bottom_3.on('change', function () {
    size.removeClass('display-none');
    $('.error_message.type4').text("");
    console.log(bottom_3.children().val())
  });
  bottom_4.on('change', function () {
    size.removeClass('display-none');
    $('.error_message.type4').text("");
  });
  // サイズ
  size.on('change', function () {
    $('.error_message.type5').text("");
  });

  //配送料の負担
  delivery_price.on('change', function () {
    $('.error_message.type7').text("");
    value = $(".delivery_price_value").val()
    delivery_type.removeClass('display-none');
    if (value == '送料込み（出品者負担）') {
      var remove_form = $(".select-form__type2")
      remove_form.remove()
      type_id = 1
      new_select_tag = build_new_select_tag_1(type_id);
      var select_form = $(".delivery_type_select")
      select_form.append(new_select_tag);
    } 
    if (value == '着払い（購入者負担）') {
      var remove_form = $(".select-form__type1")
      remove_form.remove()
      type_id = 2
      new_select_tag = build_new_select_tag_2(type_id);
      var select_form = $(".delivery_type_select")
      select_form.append(new_select_tag);
    }
  });

  
});