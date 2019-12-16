$(document).on('turbolinks:load', function(){

  jQuery(function($){
    $('.tab').click(function(){
        $('.is-active').removeClass('is-active');
        $(this).addClass('is-active');
        $('.is-show').removeClass('is-show');
        // クリックしたタブからインデックス番号を取得
        const index = $(this).index();
        // クリックしたタブと同じインデックス番号をもつコンテンツを表示
        $('.panel').eq(index).addClass('is-show');
    });
    $('.tab2').click(function(){
        $('.is-active2').removeClass('is-active2');
        $(this).addClass('is-active2');
        $('.is-show2').removeClass('is-show2');
        // クリックしたタブからインデックス番号を取得
        const index = $(this).index();
        // クリックしたタブと同じインデックス番号をもつコンテンツを表示
        $('.panel2').eq(index).addClass('is-show2');
    });
  });
  
});