$(document).on('turbolinks:load', function() {
  var form = $("#charge-form");
  Payjp.setPublicKey('pk_test_9014d2b3c3f50069a582846b');

  $("#charge-form").submit(function(e) {
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);
    var card = {
        number: parseInt($("#card_number").val()),
        cvc: parseInt($("#security_code").val()),
        exp_month: parseInt($("#expiration_month").val()),
        exp_year: parseInt($("#expiration_year").val())
    };
    Payjp.createToken(card, function(status, response) {
      if (status == 200) {
        $("#card_number").removeAttr("name");
        $("#security_code").removeAttr("name");
        $("#expiration_month").removeAttr("name");
        $("#expiration_year").removeAttr("name");

        var token = response.id;
        $("#charge-form").append($('<input type="hidden" name="payjpToken" class="payjp-token" />').val(token));
        $("#charge-form").get(0).submit();
        console.log(response.id)
      }
      else {
        alert("error")
        form.find('button').prop('disabled', false);
      }
    });
  });
});