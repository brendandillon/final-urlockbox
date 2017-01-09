var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var link = $this.parents('.link');
    var linkId = link.data('id');
    
    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    });
    
    link.find('.link_read').text('Read: true');
  })
})
