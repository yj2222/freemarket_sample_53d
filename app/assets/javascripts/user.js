$(function() { 
  $(document).ready(function(){
    $("#step2").hide();
    $("#step3").hide();
  });

  $("#button__step1").on("click", function() {
    let error;
    let value__nickname = $("input#step1__nickname").val();
    let value__email = $("input#step1__email").val();
    let value__password = $("input#step1__password").val();
    let value__firstname_kanji = $("input#step1__firstname_kanji").val();
    let value__lastname_kanji = $("input#step1__lastname_kanji").val();
    let value__firstname_katakana = $("input#step1__firstname_katakana").val();
    let value__lastname_katakana = $("input#step1__lastname_katakana").val();
    let value__birth_year = $("#user_profile_attributes_birth_year").val();
    let value__birth_month = $("#user_profile_attributes_birth_month").val();
    let value__birth_day = $("#user_profile_attributes_birth_day").val();

    if(value__nickname == ""            || value__email == ""          || value__password == "" 
      || value__firstname_kanji == ""   || value__lastname_kanji == "" || value__firstname_katakana == "" 
      || value__lastname_katakana == "" || value__birth_year == "--"   || value__birth_month == "--" 
      || value__birth_day == "--")
    {
      error = true;
      window.alert("必須項目を入力してください");
    }

    else if(!value__nickname.match(/[^\s\t]/)         || !value__email.match(/[^\s\t]/)
           || !value__password.match(/[^\s\t]/)       || !value__firstname_kanji.match(/[^\s\t]/) 
           || !value__lastname_kanji.match(/[^\s\t]/) || !value__firstname_katakana.match(/[^\s\t]/) 
           || !value__lastname_katakana.match(/[^\s\t]/))
    {
      error = true;
      window.alert("空白を含まないでください");
    }

    else if (!value__email.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/))
    {
      error = true;
      window.alert("emailを正しく入力してください");
    }

    else if(value__password.length <= 5)
    {
      debugger
      window.alert("パスワードが短すぎます");
    }

    else{
      $("#step1").hide();
      $("#step3").hide();
      $("#step2").show();
      scrollTo(0,0);
    }
  });

  $("#button__step2").on("click", function() {
    $("#step2").hide();
    $("#step3").show();
    scrollTo(0,0);
  });

  $("#new_user").on("submit", function(){
    let error;
    let value__firstname_kanji = $("input#step2__firstname_kanji").val();
    let value__lastname_kanji = $("input#step2__lastname_kanji").val();
    let value__firstname_katakana = $("input#step2__firstname_katakana").val();
    let value__lastname_katakana = $("input#step2__lastname_katakana").val();
    let value__post_number = $("input#step2__post_number").val();
    let value__prefecture = $("#user_area_attributes_prefecture").val();
    let value__city = $("input#step2__city").val();
    let value__address_number = $("input#step2__address_number").val();

    if(value__firstname_kanji == ""     || value__lastname_kanji == "" || value__firstname_katakana == ""
      || value__lastname_katakana == "" || value__post_number == ""    || value__prefecture == "--"
      || value__city == ""              || value__address_number== ""
      )
    {
      error = true;
      window.alert("必須項目を入力してください");
      return false;
    }
    else if(!value__firstname_kanji.match(/[^\s\t]/)       || !value__lastname_kanji.match(/[^\s\t]/)
            || !value__firstname_katakana.match(/[^\s\t]/) || !value__lastname_katakana.match(/[^\s\t]/)
            || !value__post_number.match(/[^\s\t]/)        || !value__city.match(/[^\s\t]/)
            || !value__address_number.match(/[^\s\t]/)
            )
    {
      debugger
      error = true;
      window.alert("空白を含まないでください");
      return false;
    }
  })
})

