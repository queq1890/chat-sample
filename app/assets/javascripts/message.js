$(document).on('turbolinks:load', function() {
    setInterval(function() {
    $.ajax({
      url: location.href.json
    })
    .done(function(data) {
      console.log("テスト");
    })
    .fail(function(data) {
      alert('自動更新に失敗しました');
    });
   } , 1000 );
});
