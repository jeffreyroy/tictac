var board = [-1, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0];
var blurb = $("#blurb");
var numMoves = 0;

$(document).ready(function() {
  clickListener();
});

var clickListener = function() {
  $(".board").on("click", function(event){
    var moveStr = $(this).attr("id").substr(1);
    move = parseInt(moveStr);
    alert(move)
    if(board[move] != 0) {
      yell("You can't move there!");
    }
    else {
      $(this).attr("src", "/images/x.jpg");
      board[move]=1;
      numMoves++;
      aiMove();
    }
  })
}

// Computer chooses a move
function aiMove() {
  // Check to see if cat's game (shouldn't see this)
  if(nummoves == 9) {
    alert("All squares occupied!");
    return [999, 999];
  }
  // Pick a random move
var ai = 0
  while (board[ai]] != 0 && n<1000) {
    ai=r(9)
    n++;
  }
  // Check for error (shouldn't see this)
  if(n>999) {
    alert("Overflow!");
  }
  // Make computer move
  board[ai] = 2;
  moveID = "#s" + ai
  $(moveID).attr('src', '/images/o.jpg');
  nummoves++;

}

function yell(text) {
  alert(text);
  // blurb.html(text);
}

function r(n){
  return Math.floor((Math.random() * n) )
}



// var clickListener = function() {
//   $(".board").on("click", function(event){
//     var moveId = $(this).attr("id").substr(1);
//     var targetURL = '/moves/' + moveId;
//     $.ajax({
//       method: "get",
//       url: targetURL
//     })
//     .done(function(response) {
//       alert(response);
//       // var json = $.parseJSON(response);
//       var moveAI = response.move;
//       var message = response.message;
//       alert(message);
//     })
//   })
// }
