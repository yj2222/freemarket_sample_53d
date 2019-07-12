$(function() {
  flag = 0;
  $(".like").on("click", function() {
    if (flag == 0) {
      $(".like").html('<i id="likes" class="fas fa-heart"></i><span class="likes">いいね</span><span class="likes">3</span')
      $(".like").css("border-color","red")
      $(".likes").css("color","red")
      $("#likes").css("color","red")
      flag = 1;
    } else {
      $(".like").html('<i id="likes" class="far fa-heart"></i><span class="likes">いいね</span><span class="likes">3</span')
      $(".like").css("border-color","#f5f5f5")
      $(".likes").css("color","black")
      $("#likes").css("color","black")
      flag = 0;
    }
  });
});