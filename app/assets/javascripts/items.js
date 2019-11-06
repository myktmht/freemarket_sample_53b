$(document).on('turbolinks:load', function(){

  $(function(){
  // ファイルアップロード
    $(".image_uploader").not(".image_uploader:first-child").css('display','none')

    // edit
    $('.item-edit-form>.image_uploader').on('change', function() {
      $(this).next().next('.image_uploader').css('display', 'block');
    });

    // new
    $('.item-new-form>.image_uploader').on('change', function() {
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

  $(function(){
    function toggleChangeBtn() {
      var slideIndex = $('.slide').index($('.active'));/*表示中のスライドのindexを取得*/
      $('.button').show();/*両ボタンを表示*/
      if(slideIndex == 0){/*一番最初の要素が表示されているとき*/
        $('.prev').hide();/*prevボタンを隠す。*/
      }else if(slideIndex == $('.slide').length - 1){/*一番最後の要素が表示されているとき*/
        $('.next').hide();/*nextボタンを隠す。*/
      }
    }
    toggleChangeBtn();

    $('.next').click(function() {
        var $displaySlide = $('.active');
        $displaySlide.removeClass('active');
        $displaySlide.next().addClass('active');
        toggleChangeBtn();
    });
    $('.prev').click(function() {
        var $displaySlide = $('.active');
        $displaySlide.removeClass('active');
        $displaySlide.prev().addClass('active');
        toggleChangeBtn();
    });
  });
});
