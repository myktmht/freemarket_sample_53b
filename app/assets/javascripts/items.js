$(document).on('turbolinks:load', function(){

  $(function(){
  // ファイルアップロード
    $(".image_uploader").not(".image_uploader:first-child").css('display','none')

    $('.image_uploader').on('change', function() {
      $(this).next('.image_uploader').css('display', 'block');
    });
  });

  // 販売価格
  $('#item_price').on('keyup', function(){
    var input = $(this).val();

    if (Math.sign(input) === 1) {
      var price_commission = Math.floor(input * 0.1).toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,');
      var price_profit = (input - Math.floor(input * 0.1)).toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,');
      $('#commission').text('\xA5' + price_commission);
      $('#profit').text('\xA5' + price_profit);
    } else {
      $('#commission').text('-');
      $('#profit').text('-');
    }
  });
});
