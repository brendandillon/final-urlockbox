var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){
  $newLinkTitle = $("#link-title");
  $newLinkUrl  = $("#link-url");

  $("#new-link").on('submit', createLink);
})

function createLink (event){
  event.preventDefault();

  console.log("win")

  var link = getLinkData();

  $.post("/api/v1/links", link)
   .then( renderLink )
   .fail( displayFailure )
 }

function getLinkData() {
 return {
   title: $newLinkTitle.val(),
   url: $newLinkUrl.val()
 }
}

function renderLink(link){
  $("#links-list").append( linkHTML(link) );
  $("#link-" + link.id + " .edit-link").click(updateLink); 
  if (link.read) {
    $("#link-" + link.id).addClass('read');
  };
  clearLink();
}

function linkHTML(link) {
  var mark_as = "Read";
  if (link.read) {
    mark_as = "Unread";
  };
    return `<div class='link' data-read=${link.read} data-id='${link.id}' id="link-${link.id}">
              <p class='link-title'>${ link.title }</p>
              <p class='link-url'>${ link.url }</p>

              <p class="link_read">
                Read: ${ link.read }
              </p>
              <p class="link_buttons">
                <button class="mark-${mark_as}">Mark as ${mark_as}</button>
                <button class='edit-link'>Edit</button>
                <button class='delete-link'>Delete</button>
              </p>
            </div>`
}

function clearLink() {
  $newLinkTitle.val("");
  $newLinkUrl.val("");
}

function displayFailure(failureData){
  $('.error-messages').text(failureData.responseJSON.join(' '));
}
