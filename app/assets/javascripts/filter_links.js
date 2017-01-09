$(document).ready(function(){
  $('#filter-read').on('click', filterRead) 
  $('#filter-unread').on('click', filterUnread) 
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
