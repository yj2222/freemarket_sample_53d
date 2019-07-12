$(document).on('turbolinks:load', function () {
  $(function (){
    $(".category-brand__list--category")
      .on('mouseover', function(){     
        $('.index-category__lists').show();  
      })
      .on('mouseover', function(){
        $('.index-category__lists__parent__child').hide();
      })
      .on('mouseover', function(){
        $('.index-category__lists__parent__child--child_list__gra-child').hide();
      })
  })   

  $(function (){
    $(".index-category__lists")
      .on('mouseover', function(){
        $('.index-category__lists__parent__child').show();
      })
      .on('mouseover', function(){
        $('.index-category__lists').show();
      })
      .on('mouseout', function(){
        $('.index-category__lists').hide();
      })
  })

  $(function (){
    $(".index-category__lists__parent__child")
      .on('mouseover', function(){
        $(".index-category__lists__parent__child--child_list__gra-child").show();
      })
      .on('mouseout', function(){
        $('.index-category__lists__parent__child--child_list__gra-child').hide();
      })    
  })

 });










