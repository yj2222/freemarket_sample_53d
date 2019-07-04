$(document).on('turbolinks:load', function () {
  var image_form = $('.exhibition__main__image-form__upload--file');

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
  
  var image_id = 1;
  var images = [];

  // ファイルがアップされた時のアクション
  image_form.on('change', function (event) {
    //選択されたファイル情報を取得、変数追加
    var image = event.target.files[0];
    images.push(image)

    // 読み込んだ画像を読み込む
    var file_reader = new FileReader();
    // onload→読み込みが完了したら以下の処理を行う
    file_reader.onload = (function () {
      // 関数の中身の結果は全て呼び出し元へ返す
      return function (event) {
        // imgタグ追加
        image_tag = build_image_tag(image_id, event.target.result);
        $('.image-upload__preview').append(image_tag);
        // ファイル数カウント
        image_id += 1;
      };
    })(image);
     file_reader.readAsDataURL(image);
  });
});
