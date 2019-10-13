$(document).on('turbolinks:load', $(function(){

  var upload_images =  $("#sell-images-area");

  function addImageField(){
    var html = `<div class="sell-content__image">
                  <input type="file" name="item[image][filename]" id="item_image_filename">
                </div>`

    upload_images.append(html);
  }

  upload_images.on("change", function(){
    var lastImage = $('input[type="file"]:last').prop('files')[0]
    if(lastImage && $('input[type="file"]').length < 10){
      addImageField();
    } else {
      return false;
    }
  });

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
}));
