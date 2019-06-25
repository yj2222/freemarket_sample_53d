$(document).on('turbolinks:load', function () {

  var parent = '.tag-box';
  var tab_right = '.tag-box__tab--right';
  var tab_left = '.tag-box__tab--left';
  var link_right = '.right-link';
  var link_left = '.left-link';

  $(tab_right).on('click', function () {
    $(this).removeClass('not-active-tab');
    $(this).addClass('active-tab');
    $(this).parent().children(tab_left).removeClass('active-tab');
    $(this).parent().children(tab_left).addClass('not-active-tab');
    
    $(this).parents(parent).children(link_right).removeClass('not-active');
    $(this).parents(parent).children(link_right).addClass('active');
    $(this).parents(parent).children(link_left).removeClass('active');
    $(this).parents(parent).children(link_left).addClass('not-active');  
  })
  $(tab_left).on('click', function () {
    $(this).removeClass('not-active-tab');
    $(this).addClass('active-tab');
    $(this).parent().children(tab_right).removeClass('active-tab');
    $(this).parent().children(tab_right).addClass('not-active-tab');

    $(this).parents(parent).children(link_left).removeClass('not-active');
    $(this).parents(parent).children(link_left).addClass('active');
    $(this).parents(parent).children(link_right).removeClass('active');
    $(this).parents(parent).children(link_right).addClass('not-active');
  })
});
