$(document).on('turbolinks:load', function () {
  $(function (){
  
    $(".category-brand__list--category")
      .on('mouseover', function(){     
        $('.index-category__lists').show();  
      })
      .on('mouseout', function(){     
        $('.index-category__lists').hide();  
      })
      .on('mouseover', function(){
        $('.index-category__lists__parent__child').hide();
      })
      .on('mouseover', function(){
        $('.index-category__lists__parent__child--child_list__gra-child').hide();
      })  
  
    $('.index-category__lists')
      .on('mouseover', function(){
        $(this).show();
      })
      .on('mouseout', function(){
        $(this).hide();
      })
    $('.index-category__lists__parent')
      .on('mouseover', function(){
        $(this).find(".index-category__lists__parent__child").show();
      })
      .on('mouseout', function(){
        $(this).find(".index-category__lists__parent__child").hide();
      })
  
    $(".index-category__lists__parent__child--child_list")
      .on('mouseover', function(){
        $(this).find(".index-category__lists__parent__child--child_list__gra-child").show();
      })
      .on('mouseout', function(){
        $(this).find('.index-category__lists__parent__child--child_list__gra-child').hide();
      })   
  })
});