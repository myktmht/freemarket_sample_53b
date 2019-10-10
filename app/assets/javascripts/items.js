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

// $(".fallback").on("change", 'input[type="file"]', function(e){
//   var file = e.target.files[0],
//   // reader = new FileReader(),
//   $preview = $(".preview");
//   console.log($preview)
//   t = this;

//   if(file.type.indexOf("image") < 0){
//     return false;
//   }

//    // ファイル読み込みが完了した際のイベント登録
//    new FileReader().onload = (function(file) {
//     return function(e) {
//       //既存のプレビューを削除
//       $preview.empty();
//       // .prevewの領域の中にロードした画像を表示するimageタグを追加
//       $preview.append($('<img>').attr({
//                 src: e.target.result,
//                 width: "150px",
//                 class: "preview",
//                 title: file.name
//             }));
//     };
//   })(file);

//   new FileReader().readAsDataURL(file);
// });

  // $('#item_price').on('keyup', function(){
  //   var input = $(this).val();

  //   if (Math.sign(input) === 1) {
  //     var price_commission = Math.floor(input * 0.1).toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,');
  //     var price_profit = (input - Math.floor(input * 0.1)).toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,');
  //     $('#commission').text('\xA5' + price_commission);
  //     $('#profit').text('\xA5' + price_profit);
  //   } else {
  //     $('#commission').text('-');
  //     $('#profit').text('-');
  //   }
  // });

  // $(function(){
  //   Dropzone.autoDiscover = false;

  //     $(".dropzone").dropzone({
  //       maxFilesize: 1,
  //       addRemoveLinks: true
  //     });

  //     Dropzone.options.myAwesomeDropzone = {
  //       paramName : "file",
  //       paralleUploads : 1,
  //       acceptedFiles : 'image/*',
  //       maxFiles: 10,
  //       maxFilesize: 3,
  //       dictFileTooBig: "ファイルが大きすぎます。(@{{filesize}}MB). 最大サイズ: @{{maxFilesize}}MB.",
  //       dictInvalidFileType: "画像ファイルのみアップロードが可能です。",
  //       dictMaxFilesExceeded: "ファイルは10ファイルまで追加が可能です。",
  //       dictDefaultMessage: "ここへファイルをドラッグ＆ドロップするとアップロードされます。<br>最大10ファイルまでアップ可能です。<br><br>（もしくはここをクリックするとファイル選択ウインドウが表示されますのでそこで選択してもアップ可能です）"
  //     };

  //   new Dropzone('#upload-dropzone', {
  //     uploadMultiple: false,
  //     paramName: 'image[filename]',
  //     params: {
  //       'image[item_id]': 123
  //     },
  //     init: function() {
  //       return this.on('success', function(file, json) {});
  //     },
  //     dictDefaultMessage: '<i class="fa fa-file-o fa-2x"></i><br>\n<br>\nファイルをここにドロップするか<br>\nここをクリックして下さい'
  //   });
  // });