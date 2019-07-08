$(function() { 
  $(document).ready(function(){
    $("#step2").hide();
    $("#step3").hide();
  });

  $("#button__step1").on("click", function() {
    $("#step1").hide();
    $("#step3").hide();
    $("#step2").show();
    scrollTo(0,0);
  });

  $("#button__step2").on("click", function() {
    $("#step2").hide();
    $("#step3").show();
    scrollTo(0,0);
  });
})
