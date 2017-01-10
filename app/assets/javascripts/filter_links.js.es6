$(document).ready(function(){
  $('#filter-read').on('click', filterRead) 
  $('#filter-unread').on('click', filterUnread) 
  $('#search').on('keypress', filterBySearch)
})

function filterRead () {
  $('.link').each(function(index, link) {
    if (!$(link).data('read')) {
      $(link).hide();
    } else {
      $(link).show();
    }
  });
}

function filterUnread() {
  $('.link').each(function(index, link) {
    if ($(link).data('read')) {
      $(link).hide();
    } else {
      $(link).show();
    }
  });
}

function filterBySearch() {
  var search = $('#search').val();
  $('.link').each(function(index, link) {
    if (checkMatch.bind(this)(search)) {
      $(link).show();
    } else {
      $(link).hide();
    }
  });
}

function checkMatch(textToMatch) {
  var title = $(this).find('.link-title').text();
  var url = $(this).find('.link-url').text();
  return (title.includes(textToMatch) || url.includes(textToMatch))
}
