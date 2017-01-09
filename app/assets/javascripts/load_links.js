var hotReads;
$(document).ready(function(){
  $.get('http://bd-final-hotreads.herokuapp.com/links', function(reads) {
    hotReads = reads;
  }).then(function() {
    $.get('/api/v1/links')
     .then(placeLinks)
  })
})

function placeLinks (links){
  links.forEach(renderLink);
}
