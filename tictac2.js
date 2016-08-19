// JavaScript for Tic Tac Toe

var board_position = [3, 0, 0, 0, 0, 0, 0, 0, 0, 0];
var board_id = ["x", "a", "b", "c", "d", "e", "f", "g", "h", "i"];
var nummoves = 0;


// Input player's move from web page
function play(space) {
	if (board_position[space] == 0) {
		board_position[space] = 1;
		document.getElementById(board_id[space]).src = 'x.jpg';
		document.getElementById("blurb").innerHTML =
			"You just moved to square " + board_id[space] + ".  Let me think...";
		nummoves++;
		if (nummoves == 9) {
			document.getElementById("blurb").innerHTML =
			"Cat's game!  Thanks for playing!";
		}
		else {
			compplay()
		}
	}
}

function rand(n) {
	return Math.floor((Math.random() * n) + 1)
}

// Computer chooses a move
function compplay() {
	// Check to see if cat's game (shouldn't see this)
	if(nummoves == 9) {
		window.alert("All squares occupied!");
		return [999, 999];
	}
	space = computerRandomMove()
	makeComputerMove(space)
}

// Pick a random move
function computerRandomMove() {
	var space = rand(9);
	var n = 0;
	while (board_position[space] > 0 && n < 1000) {
		space = rand(9);
		n++;
	}
	// Check for error (shouldn't see this)
	if(n > 999) {
		window.alert("Overflow!");
	}
	return space
}

// Make computer move
function makeComputerMove(space) {
	board_position[space] = 2;
	document.getElementById(board_id[space]).src = 'o.jpg';
	document.getElementById("blurb").innerHTML =
		"I move to square " + board_id[space] + ".  Your move.";
	nummoves++;
}
