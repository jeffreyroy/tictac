// JavaScript for Tic Tac Toe

var board_position = [[0, 0, 0], [0, 0, 0], [0, 0, 0]];
var board_id = [["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"]]
var nummoves = 0;


// Input player's move from web page
function play(x, y) {

	if (board_position[x][y] == 0) {
		board_position[x][y] = 1;
		document.getElementById(board_id[x][y]).src = '/images/x.jpg';
		document.getElementById("blurb").innerHTML =
			"You just moved to square " + board_id[x][y] + ".  Let me think...";
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

function r(n){
	return Math.floor((Math.random() * n) )
}
// Computer chooses a move
function compplay() {
	// Check to see if cat's game (shouldn't see this)
	if(nummoves == 9) {
		window.alert("All squares occupied!");
		return [999, 999];
	}
	// Pick a random move
	var cx=r(3), cy=r(3);
	var n = 0;
	while (board_position[cx][cy] > 0 && n<1000) {
		cx = r(3);
		cy = r(3);
		n++;
	}
	// Check for error (shouldn't see this)
	if(n>999) {
		window.alert("Overflow!");
	}
	// Make computer move
	board_position[cx][cy] = 2;
	document.getElementById(board_id[cx][cy]).src = '/images/o.jpg';
	document.getElementById("blurb").innerHTML =
		"I move to square " + board_id[cx][cy] + ".  Your move.";
	nummoves++;

}
