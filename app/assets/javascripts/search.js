$(function(){
  var search_list = $('#user-search-result');
  var group_user_list = $('#chat-group-users');
function appendUser(user) {
  var html = `<div class="chat-group-user clearfix">
                <p class="chat-group-user__name">${user.name}</p>
                <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
              </div>`
    search_list.append(html);
 }

function appendNouser(user) {
    var html = `<div class="chat-group-user clearfix">
                <p class="chat-group-user__name">${user}</p>
              </div>`
    search_list.append(html);
  }

function appendGroupUser(name, id) {
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                  <input name='group[user_ids][]' type='hidden' value='${ id }'>
                  <p class='chat-group-user__name'>${ name }</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`
    group_user_list.append(html);
  }

  $("#user-search-field").on("keyup", function(){
    var input = $("#user-search-field").val();
    $.ajax({
    type: 'GET',
    url: '/users',
    data: { keyword: input },
    dataType: 'json'
  })
  .done(function(users) {
    search_list.empty();
    if (users.length !== 0) {
      users.forEach(function(user){
        appendUser(user);
      });
    }
    else {
      appendNouser("一致するユーザーが見つかりませんでした");
    }
  })
  .fail(function() {
    alert('ユーザー検索に失敗しました');
  })
  });
  $(document).on("click",".user-search-add",function(){
    var group_user_name = $(this).attr("data-user-name");
    var group_user_id = $(this).attr("data-user-id");
    $(this).parent().remove();
    appendGroupUser(group_user_name, group_user_id);
  });
});
