// alert("hey")
console.log("log")

var setupHeader = function() {
  $("h2").addClass("header")
}

var styleLinks = function(btnClass) {
  $(".js-btn").addClass("btn-" + btnClass)
}

// .addEventListener("click", function())
// .onClick = function()
$(document).ready(function() {
  setupHeader()
  styleLinks("primary")

  $(".js-btn").click(function(e) {
    e.preventDefault()

    var clicked = $(this)
    var itemId = clicked.data("item-id")

    // alert("You clicked on a link: " + itemId)
    window.location.href = "/items/" + itemId + "/edit"
  })
})
