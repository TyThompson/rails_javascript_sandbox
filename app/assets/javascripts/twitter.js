var maxlength = 180
var count = 0

var computeLetterCount = function() {
  var contents = $("#tweet-contents")

  var tweet = contents.val()

  $("#new-tweet p").text( (maxlength - tweet.length) + " characters left" )
}

$(document).ready(function() {
  $("#tweet-contents").attr("maxlength", maxlength)
  $("#add-counter").click(function() {
    console.log("Clicked Add")
    $("#new-counter p").text( (count += 1 ))
  })
  $("#sub-counter").click(function() {
    console.log("Clicked Subtract")
    $("#new-counter p").text( (count -= 1 ))
  })
  $("#reset-counter").click(function() {
    console.log("Clicked Reset")
    var count = 0
    $("#new-counter p").text( count )
  })
  $("#save-tweet").click(function() {
    console.log("clicked btn")

    var contents = $("#tweet-contents")

    var tweet = contents.val()

    if (tweet.length > 0) {
      contents.val("")
      contents.removeClass("invalid")

      computeLetterCount()

      // var item = $("<li>" + tweet + "<button class='delete-btn'>X</button></li>")

      var item = $("<li>")
      item.append( $("<span>").text(tweet) )
      var newBtn = $("<button>").addClass("delete-btn").text("X")
      item.append( newBtn )

      newBtn.click(function() {
        // $(this).parent().remove()
        item.remove()
      })

      $(".item-list").append( item )
    } else {
      contents.addClass("invalid")
    }
  })

  // $("#tweet-contents").keyup(function() {
  //   computeLetterCount()
  // })
  $("#tweet-contents").keyup( computeLetterCount )

  computeLetterCount()
})
