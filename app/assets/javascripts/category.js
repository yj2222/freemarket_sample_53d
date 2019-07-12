$(document).on('turbolinks:load', function () {

  var top = $('.category_top');
  var middle = $('.category_middle');
  var bottom = $('.category_bottom');
  var size = $('.size-form');

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
    $('.error_message.type4').text("");
  });

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