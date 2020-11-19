$(function() {
  $(document).on("click", ".js-edit-comment-button", function () {
    const commentId = $(this).data("comment-id")
    const commentLabelArea = $("#js-comment-" + commentId)
    const commentTextArea = $("#js-textarea-comment-box-" + commentId)

    commentLabelArea.hide()
    commentTextArea.show()
    return false
  }),

  // キャンセルボタンが押されたとき
  $(document).on("click", '.js-button-edit-comment-cancel', function() {
    const commentId = $(this).data("comment-id")
    const commentLabelArea = $("#js-comment-" + commentId)
    const commentTextArea = $("#js-textarea-comment-box-" + commentId)

    commentLabelArea.show()
    commentTextArea.hide()
  }),

// 更新ボタンが押されたとき
  $(document).on("click", '.js-button-comment-update', function() {
    const commentId = $(this).data("comment-id")
    const commentText = $("#js-textarea-comment-" + commentId)
    const body = commentText.val()
    console.log(body)

    $.ajax({
      type: 'PATCH',
      url: '/comments/' + commentId,
      data: {
        comment: {
          body: body
        }
      }
    }).done(function (data) { // ajax通信が成功した時の処理
      const commentLabelArea = $('#js-comment-' + commentId);
      const commentTextArea = $('#js-textarea-comment-box-' + commentId);
      const commentButton = $('#js-comment-button-' + commentId);
      const commentError = $('#js-comment-post-error-' + commentId);

      commentLabelArea.show();
      commentLabelArea.text(data.body);
      commentTextArea.hide();
      commentButton.hide();
      commentError.hide();
    }).fail(function () {
      const commentError = $('#js-comment-post-error-' + commentId);
      commentError.text('コメントを入力してください');
    })
  })
})