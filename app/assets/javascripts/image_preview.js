$(document).on('turbolinks:load', function () {

  function build_image_tag(alt, src) {
    var html = `<li class="image-upload__preview__list">
                  <div class="image-upload__preview__list__top">
                    <img src="${src}" alt="${alt}" width="114" height="50" class="image-upload__preview__list__top--image">
                  </div>
                  <div class="image-upload__preview__list__bottom">
                    <span class="image-upload__preview__list__bottom--btn btn-left">編集</span>
                    <span class="image-upload__preview__list__bottom--btn">削除</span>
                  </div>
                </li>`
    return html;
  }

  function build_new_input_tag(count) {
    var html = `<input autofocus="autofocus" name="images[${count}][image_url]" class="exhibition__main__image-form__upload--file display-none" type="file" id="image${count}">`
    return html;
  }

  var image_id = 1;
  var image_form = $('.exhibition__main__image-form__upload');
  var input_tag = 'input[name="images[' + image_id + '][image_url]"]';
  var preview_ul = $('.image-upload__preview');

  image_form.on('click', function() {
    image_form.children('input[name="images[' + image_id + '][image_url]"]')[0].click();
    console.log(image_form)
  })

  image_form.on("dragover", function(event) {
    event.preventDefault();  
    event.stopPropagation();
    image_form.children('input[name="images[' + image_id + '][image_url]"]').removeClass('display-none');
  });

  image_form.on('drop', function(e) {
    //dropzone-jsを使う時は下記の画面遷移停止を定義すると動かなくなる。
    // e.preventDefault();  
    // e.stopPropagation();
    image_form.children('input[name="images[' + image_id + '][image_url]"]').addClass('display-none');

  })

  // ファイルがアップされた時のアクション
  image_form.on('change', image_form.children('input[name="images[' + image_id + '][image_url]"]'), function (event) {
    //選択されたファイル情報を取得。[0]はJSのオブジェクトを使う宣言？
    var image = event.target.files[0];
    // console.log(image)

    // 読み込んだ画像を読み込む
    var file_reader = new FileReader();
    // onload→読み込みが完了したら以下の処理を行う
    file_reader.onload = (function () {
      // 関数の中身の結果は全て呼び出し元へ返す
      return function (event) {
        // プレビュー表示
        image_tag = build_image_tag(image_id, event.target.result);
        preview_ul.append(image_tag);

        // 2 || 6 という条件分岐にしたかったがうまくイベントが動かなかったため全ての条件を記載
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
        // console.log(new_input_tag)
      };
    })(image);
     file_reader.readAsDataURL(image);
  });
});
