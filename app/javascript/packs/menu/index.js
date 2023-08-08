$(document).on('click', '.favorite-button', function(e) {
  e.preventDefault();
  const button = $(this);
  const menuId = button.data('menu-id');
  const url = button.attr('href');
  const method = button.data('method') || 'POST'; // メソッドをdata属性から取得

  $.ajax({
    url: url,
    method: method,
    dataType: 'json',
  })
  .done(function(data) {
    if (data.status === 'favorited') {
      button.text('お気に入り解除する').removeClass('btn-primary').addClass('btn-danger');
    } else {
      button.text('お気に入りする').removeClass('btn-danger').addClass('btn-primary');
    }
  })
  .fail(function() {
    alert('エラーが発生しました。');
  });
});
