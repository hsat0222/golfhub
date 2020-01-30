// App.room = App.cable.subscriptions.create("RoomChannel", {

//   connected: function(){
//     // Called when the subscription is ready for use on the server
//   },

//   disconnected: function(){
//     // Called when the subscription has been terminated by the server
//   },

//   received: function(message){
//     const messages = document.getElementById('messages')
//     messages.innerHTML += message
//     // Called when there's incoming data on the websocket for this channel
//   },

//   speak: function(content){
//     return this.perform('speak', {message: content});
//   }
// });

// document.addEventListener('DOMContentLoaded',function(){
//   const input = document.getElementById('.form-text-field')
//   const button = document.getElementById('.form-submit')
//   button.addEventListener('click', function(){
//     const content = input.value
//     App.room.speak(content)
//     input.value = ''
//   })
// })

App.room = App.cable.subscriptions.create({ channel: "RoomChannel", room_id: room_id }, {　//サブスクリプション
  connected: function() {},　//使ってない
  disconnected: function() {},　//つかってない
  received: function(data) {　　//ブロードキャストされたデータが入ってくる　ここに
    $('.messages').append(data['content']);　//.messagesにappend（記述）される要素を追加
  },
  speak: function(message) {
    return this.perform('speak', {　//channel.rb speakメソッド実行
      message: message,            //
      room_id: room_id,
      user_id: $('meta[name="current_user_id"]').attr('content')
    });
  }
});
$(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
  if (event.keyCode === 13) {                 //13はエンターキー
    App.chat_room.speak(event.target.value);　　　//
    event.target.value = '';   //空にする
    return event.preventDefault();　//画面遷移が起こる？を防ぐ
  }
});
