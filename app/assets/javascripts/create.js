$(function() {
  function buildHTML(message){
    if (message.image !== "") {
      var addImage = `<img src="${message.image}">`
     }
    var html = `<div class="message">
                  <div class="message__user">
                    ${message.user_name}
                  </div>
                  <div class="message__date">
                    ${message.created_at}
                  </div>
                  <div class="message__content">
                    ${message.body}
                    ${addImage}
                  </div>
                </div>`
    return html;
  }
  $('#chat_form').on('submit', function(e){
    e.preventDefault();
    var fd = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      type: 'POST',
      url: url,
      data: fd,
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data){
      var html = buildHTML(data);
      var scroll_target = $('.right_contents__messages')

      $('.right_contents__messages').append(html)
      $('.right_contents__input__text').val('');
      $('.right_contents__input__file').val('');
      scroll_target.animate({
      scrollTop: scroll_target[0].scrollHeight
    })
      $('.right_contents__input__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    });
  });
});
