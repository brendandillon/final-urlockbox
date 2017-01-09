var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-Read', setMarkRead)

  $('#links-list').on('click', 'button.mark-Unread', setMarkUnread)
})

function setMarkRead() {
  var $this = $(this);
  var link = $this.parents('.link');
  var linkId = link.data('id');
  
  $.ajax({
    url: '/api/v1/links/' + linkId,
    method: 'PATCH',
    data: {read: true}
  })
   .then(function() {
    link.find('.link_read').text('Read: true');
    link.addClass('read');

    $this.text('Mark as Unread')
    $this.off();
  }).then(function() {
    $this.on('click', setMarkUnread);
  });
}

function setMarkUnread() {
  var $this = $(this);
  var link = $this.parents('.link');
  var linkId = link.data('id');
  
  $.ajax({
    url: '/api/v1/links/' + linkId,
    method: 'PATCH',
    data: {read: false}
  })
   .then(function() {
    link.find('.link_read').text('Read: false');
    link.removeClass('read');

    $this.text('Mark as Read')
    $this.off();
  }).then(function() {
    $this.on('click', setMarkRead);
  });
}
