$(document).ready(function(){
  $.get('/api/v1/links')
   .then(placeLinks)
})

function placeLinks (links){
  links.forEach(renderLink);
}
