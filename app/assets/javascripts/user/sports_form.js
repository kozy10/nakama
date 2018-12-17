$(function () {
  // セレクトボックス毎に処理
  $('select').each(function(i){

    // data-selectを追加
    $(this).attr('id', 'select'+i);

    // セレクトボックスの内容をモーダルウィンドウにコピー
    var clone = $(this).clone().appendTo($(this).parent());
    var remodal_clone = $(clone).wrap('<div data-remodal-id="remodal-select'+i+'" class="remodal remodal-select"></div>').after('<button data-remodal-action="close" class="remodal-close bottom-close"></button>');

    $(remodal_clone).children('option').each(function(){
      var tag_value = $(this).attr("value");
      if ( tag_value == "") {
        $(this).replaceWith('');
      } else {
        var tag_value_plus = 'data-value="'+tag_value+'"';
        $(this).replaceWith('<li '+tag_value_plus+'>'+$(this).html()+'</li>');
      }
    });
    $(remodal_clone).each(function(){
      $(this).replaceWith('<ul>'+$(this).html()+'</ul>');
    });

    // 元のセレクトボックスは非表示
    $(this).css('display','none');

    // 選択中のoption情報取得
    var selected = $(this).find(':selected');
    var selected_val = $(selected).val();
    var selected_text = $(selected).text();
    $('a[href = "#remodal-select'+i+'"]').text(selected_text);

    // モーダルウィンドウを開くリンク生成
    $(this).after('<a href="#remodal-select'+i+'" class="remodal-select-open">'+selected_text+'</a>');

  });

  // モーダルウィンドウの中をクリックした時の動作
  $('.remodal-select').each(function(i){

    var select_id = $(this).data('select');

    $(this).find('li').on('click', function() {

      var text = $(this).text();
      var value = $(this).data('value');

      $('#select'+i).val([value]);

      $('a[href = "#remodal-select'+i+'"]').text(text);

      // class付与
      $(this).siblings().removeClass("selected");
      $(this).addClass("selected");
      $(function() {
        $('[data-remodal-id=remodal-select'+i+']').remodal().close();
      });
      
    });

  });

});