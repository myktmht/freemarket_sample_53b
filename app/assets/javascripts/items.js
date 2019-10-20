$(document).on('turbolinks:load', $(function(){

  // // 出品画像
  // var upload_images =  $("#sell-images-area");

  // function addImageField(i){
  //   var html = `<div class="sell-content__image">
  //                 <input type="file" name="image[filename][]" id="item_image_filename">
  //               </div>`

  //   upload_images.append(html);
  // }

  // var i = 0;
  // upload_images.on("change", function(){
  //   var lastImage = $('input[type="file"]:last').prop('files')[0]
  //   if(lastImage && $('input[type="file"]').length < 10){
  //     i++
  //     addImageField(i);
  //   } else {
  //     return false;
  //   }
  // });

  // // 商品の詳細＞カテゴリー
  // $("#category0").on("change", function(){
  // // 大カテゴリー(0)選択時の値を取得
  //   var category0_val = $("option:selected").val();
  // // 中カテゴリー(1)選択時の値を取得
  //   var category1_val = $("option:selected").val();
  // });

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
}));
