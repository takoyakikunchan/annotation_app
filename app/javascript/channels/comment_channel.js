import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    const html = `<p>
                    <strong><a href="/users/${data.content.user_id}">${data.nickname}</a>：</strong>
                      ${data.content.text}
                 
                  <a  href= "/songs/${data.song.id}/comments/${data.content.id}/favorites", data-method="post"><i class="far fa-thumbs-up thum-icon"></i></a>
                  <a href= "/songs/${data.song.id}/comments/${data.content.id}", data-method="delete" ><i class="far fa-trash-alt trash-icon"></i>"削除"</a>  </p>`      
                 
                  const messages = document.getElementById('comments');
       const newMessage = document.getElementById('comment_text');
       messages.insertAdjacentHTML('afterbegin', html);
       newMessage.value='';
  }
});