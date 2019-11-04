$(document).on('turbolinks:load', function(){

  $(function(){
    //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
    // $('form').on('change', 'input[type="file"]', function(e) {
    //   var file = e.target.files[0],
    //       reader = new FileReader(),
    //       $preview = $("#preview");
    //       t = this;

    //   var image_preview = $("#preview");

    //   function appendPreview(img){
    //     console.log(img);
    //     var html = `<li class="preview">
    //                   <div class="preview-img">
    //                     ${ img }
    //                   </div>
    //                   <div class="preview-button">
    //                     <a href="" class="preview-button-delete">削除</a>
    //                   </div>
    //                 </li>`

    //     image_preview.append(html)
    //   }

    //   // 画像ファイル以外の場合は何もしない
    //   if(file.type.indexOf("image") < 0){
    //     return false;
    //   }
  
    //   // ファイル読み込みが完了した際のイベント登録
    //   reader.onload = (function(file) {
    //     return function(e) {
    //       // .prevewの領域の中にロードした画像を表示するimageタグを追加
    //       var img = $('<img>').attr({
    //         src: e.target.result,
    //         width: "150px",
    //         class: "preview",
    //         title: file.name
    //       })
    //       appendPreview(img);
    //     };
    //   })
    // });

    // previewの削除
    $(document).on('click', '.preview-button-delete', function() {
      $(this).parent().parent().remove();
    })
  });

  // // カテゴリーの絞り込み(要検討)
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
});
