function updateLink () {
  var link = $(this).closest('.link')
  link.addClass('editable')
  link.find('.link-title').attr('contenteditable', true)  
  link.find('.link-url').attr('contenteditable', true)  

  $(this).off();
  $(this).text('Submit Changes');
  $(this).on('click', submitChanges);
}

function submitChanges () {
  var link = $(this).closest('.link')
  var id = link.data('id')
  var title = link.find('.link-title').text();
  var url = link.find('.link-url').text();
  $.ajax({
    url: 'api/v1/links/' + id,
    method: 'PUT',
    data: {
      title: title,
      url: url
    }
  })
  .then(
    changeButtonToEdit.bind(this)
  )
  .fail( displayFailure )
}

function changeButtonToEdit () {
  var link = $(this).closest('.link')
  link.removeClass('editable');
  link.find('.link-title').attr('contenteditable', false);
  link.find('.link-url').attr('contenteditable', false);  
  
  $(this).off();
  $(this).text('Edit');
  $(this).on('click', updateLink);
}

