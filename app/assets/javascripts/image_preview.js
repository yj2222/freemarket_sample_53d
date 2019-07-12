$(document).on('turbolinks:load', function () {

  function build_image_tag(alt, src) {
    var html = `<li class="image-upload__preview__list">
                  <div class="image-upload__preview__list__top">
                    <img src="${src}" alt="${alt}" width="114" height="100" class="image-upload__preview__list__top--image">
                  </div>
                  <div class="image-upload__preview__list__bottom">
                    <span class="image-upload__preview__list__bottom--btn btn-left">編集</span>
                    <span class="image-upload__preview__list__bottom--btn btn-right btn-${alt}">削除</span>
                  </div>
                </li>`
    return html;
  }

  function build_new_input_tag(count) {
    var html = `<input autofocus="autofocus" name="images[${count}][url]" class="exhibition__main__image-form__upload--file display-none" type="file" id="image${count}">`
    return html;
  }

  //削除ボタンが押された時のアクション
  $(function(){
    $(document).on('click', '.btn-right', function() {

      var num = $(this).attr('class').slice( -1 );
      btn_id = Number(num)
      last_image_id = image_id - 1

      //ボタンのIDと最新の画像のIDが一緒なら以下を実行
      if (btn_id == last_image_id){
        list = $(this).parent().parent()
        list.remove();
        var input = image_form.children('input[name="images[' + last_image_id + '][url]"]')
        input.empty();
        var input = image_form.children('input[name="images[' + image_id + '][url]"]')
        input.remove();
        image_id -= 1
      }

      //ドロップボックスの大きさを変更する
      if (image_id == 1) {
        image_form.removeClass('box-size--wide_middle');
        image_form.addClass('box-size--wide');
      } else if (image_id == 2){
        image_form.removeClass('box-size--middle');
        image_form.addClass('box-size--wide_middle');
      } else if (image_id == 3){
        image_form.removeClass('box-size--narrow_middle');
        image_form.addClass('box-size--middle');
      } else if (image_id == 4){
        image_form.removeClass('box-size--narrow');
        image_form.addClass('box-size--narrow_middle');
      } else if (image_id == 5){
        image_form.removeClass('box-size--wide');
        image_form.addClass('box-size--narrow');
      } else if (image_id == 6) {
        image_form.removeClass('box-size--wide_middle');
        image_form.addClass('box-size--wide');
      } else if (image_id == 7){
        image_form.removeClass('box-size--middle');
        image_form.addClass('box-size--wide_middle');
      } else if (image_id == 8){
        image_form.removeClass('box-size--narrow_middle');
        image_form.addClass('box-size--middle');
      } else if (image_id == 9){
        image_form.removeClass('box-size--narrow');
        image_form.addClass('box-size--narrow_middle');
      } else if (image_id == 10){
        image_form.removeClass('display-none');
      }

    });

  });

  var image_id = 1;
  var image_form = $('.exhibition__main__image-form__upload');
  var input_tag = 'input[name="images[' + image_id + '][url]"]';
  var preview_ul = $('.image-upload__preview');

  //クリックアクションイベント発火
  image_form.on('click', function() {
    image_form.children('input[name="images[' + image_id + '][url]"]')[0].click();
  })

  //ドラッグアンドドロップアクションイベント発火
  image_form.on("dragover", function(event) {
    event.preventDefault();  
    event.stopPropagation();
    image_form.children('input[name="images[' + image_id + '][url]"]').removeClass('display-none');
  });
  image_form.on('drop', function(e) {
    image_form.children('input[name="images[' + image_id + '][url]"]').addClass('display-none');

  })

  // ファイルがアップされた時のアクション
  image_form.on('change', image_form.children('input[name="images[' + image_id + '][url]"]'), function (event) {
    $('.error_message.type1').text("");
    //選択されたファイル情報を取得。[0]はJSのオブジェクトを使う宣言？
    var image = event.target.files[0];
    // 読み込んだ画像を読み込む
    var file_reader = new FileReader();
    // onload→読み込みが完了したら以下の処理を行う
    file_reader.onload = (function () {
      // 関数の中身の結果は全て呼び出し元へ返す
      return function (event) {
        // プレビュー表示
        image_tag = build_image_tag(image_id, event.target.result);
        preview_ul.append(image_tag);

        // ドロプゾーンのリサイズ
        if (image_id == 1) {
          image_form.removeClass('box-size--wide');
          image_form.addClass('box-size--wide_middle');
        } else if (image_id == 2){
          image_form.removeClass('box-size--wide_middle');
          image_form.addClass('box-size--middle');
        } else if (image_id == 3){
          image_form.removeClass('box-size--middle');
          image_form.addClass('box-size--narrow_middle');
        } else if (image_id == 4){
          image_form.removeClass('box-size--narrow_middle');
          image_form.addClass('box-size--narrow');
        } else if (image_id == 5){
          image_form.removeClass('box-size--narrow');
          image_form.addClass('box-size--wide');
        } else if (image_id == 6) {
          image_form.removeClass('box-size--wide');
          image_form.addClass('box-size--wide_middle');
        } else if (image_id == 7){
          image_form.removeClass('box-size--wide_middle');
          image_form.addClass('box-size--middle');
        } else if (image_id == 8){
          image_form.removeClass('box-size--middle');
          image_form.addClass('box-size--narrow_middle');
        } else if (image_id == 9){
          image_form.removeClass('box-size--narrow_middle');
          image_form.addClass('box-size--narrow');
        } else if (image_id == 10){
          image_form.addClass('display-none');
        }

        $('.exhibition__main__image-form__upload').before($('.image-upload__preview__list'));

        // ファイル数カウント
        image_id += 1;
        // imgタグ追加
        new_input_tag = build_new_input_tag(image_id);
        image_form.append(new_input_tag);
      };
    })(image);
     file_reader.readAsDataURL(image);
  });

});
