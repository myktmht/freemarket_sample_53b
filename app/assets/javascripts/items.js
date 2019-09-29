$(function(){
  $('#item_price').on('keyup', function(){
    var input = $(this).val();

    if (Math.sign(input) === 1) {
      var price_commission = Math.floor(input * 0.1)
      var price_profit = input - price_commission;

      $('#commission').text('\xA5' + price_commission);
      $('#profit').text('\xA5' + price_profit);

      } else {

      $('#commission').text('-');
      $('#profit').text('-');
      
    }
  });
});