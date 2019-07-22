$(document).on('turbolinks:load', function () {
  $('.exhibition').submit(function() {

    var category_middle_1_val = $(".category_middle_1").children().val();
    var category_middle_2_val = $(".category_middle_2").children().val();
    var category_middle_3_val = $(".category_middle_3").children().val();
    var category_middle_4_val = $(".category_middle_4").children().val();

    if (category_middle_1_val != 0 || category_middle_2_val != 0 || category_middle_3_val != 0 || category_middle_4_val != 0 ) {
      if (category_middle_1_val == 0) {
        $(".category_middle_1").remove();
      }
      if (category_middle_2_val == 0) {
        $(".category_middle_2").remove();
      }
      if (category_middle_3_val == 0) {
        $(".category_middle_3").remove();
      }
      if (category_middle_4_val == 0) {
        $(".category_middle_4").remove();
      }
    }

    var category_bottom_val_1 = $(".category_bottom_1").children().val();
    var category_bottom_val_2 = $(".category_bottom_2").children().val();
    var category_bottom_val_3 = $(".category_bottom_3").children().val();
    var category_bottom_val_4 = $(".category_bottom_4").children().val();

    if (category_bottom_val_1 != 0 || category_bottom_val_2 != 0 || category_bottom_val_3 != 0 || category_bottom_val_4 != 0 ) {
      if (category_bottom_val_1 == 0){
        $(".category_bottom_1").remove();
      }
      if (category_bottom_val_2 == 0) {
        $(".category_bottom_2").remove();
      }
      if (category_bottom_val_3 == 0) {
        $(".category_bottom_3").remove();
      }
      if (category_bottom_val_4 == 0) {
        $(".category_bottom_4").remove();
      }
    }


    var image_val = $('[name="images[0][url]"]').val();
    var name_box_val = $('.name_box_val').val();
    var description_box_val = $('.description_box_val').val();
    var category_select_val = $('[name="product[category_id]"]').val();
    var size_select_val = $('[name="product[size]"]').val();
    var condition_select_val = $('[name="product[condition]"]').val();
    var delivery_price_select_val = $('[name="product[delivery_price]"]').val();
    var delivery_type_select_val = $('[name="product[delivery_type]"]').val();
    var prefecture_select_val = $('[name="product[prefecture]"]').val();
    var delivery_days_select_val = $('[name="product[delivery_days]"]').val();
    var price_box_val = $('[name="product[price]"]').val();

    if (image_val == "") {
      $('.error_message.type1').text("画像がありません");
    } 
    if (name_box_val == "") {
      $('.error_message.type2').text("入力してください");
    } 
    if (description_box_val == "") {
      $('.error_message.type3').text("入力してください");
    }
    if (category_select_val == 0) {
      $('.error_message.type4').text("選択してください");
    } 
    if (size_select_val == "") {
      $('.error_message.type5').text("選択してください");
    } 
    if (condition_select_val == "") {
      $('.error_message.type6').text("選択してください");
    } 
    if (delivery_price_select_val == "") {
      $('.error_message.type7').text("選択してください");
    } 
    if (delivery_type_select_val == "") {
      $('.error_message.type8').text("選択してください");
    } 
    if (prefecture_select_val == "") {
      $('.error_message.type9').text("選択してください");
    } 
    if (delivery_days_select_val == "") {
      $('.error_message.type10').text("選択してください");
    } 
    if (price_box_val == "") {
      $('.error_message.type11').text("300以上9999999以下で入力してください");
    }
    if (image_val == "" || name_box_val == "" || description_box_val == "" || category_select_val == "" || size_select_val == "" || condition_select_val == "" || delivery_price_select_val == "" || delivery_type_select_val == "" || prefecture_select_val == "" || delivery_days_select_val == "" || price_box_val == "") {
      return false;
    } 

  });
});


