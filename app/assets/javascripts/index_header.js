$(document).on('turbolinks:load', function() {
  $(".bottom-header__like__index").hover(function() {
    $(this).css('color', '#00BFFF');
  },
  function() {
    $(this).css('color', '');
  });
  $(".bottom-header__information").hover(function() {
    $(this).css('color', '#00BFFF');
  },
  function() {
    $(this).css('color', '');
  });
  $(".bottom-header__todo__list").hover(function() {
    $(this).css('color', '#00BFFF');
  },
  function() {
    $(this).css('color', '');
  });
  $(".bottom-header__move__mypage").hover(function() {
    $(this).css('color', '#00BFFF');
  },
  function() {
    $(this).css('color', '');
  });

  $("").on("click", function() {
    $(this).css('color', 'black');
  });
});