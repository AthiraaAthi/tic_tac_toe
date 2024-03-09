class Player {
  static const x = "X";
  static const y = "Y";
  static const empty = "";
}

class Game {
  static final boardLength = 9;
  static final blocSize = 100.0;

  //creating an empty board
  List<String>? board;
  static List<String>? initGameBoard() =>
      List.generate(boardLength, (index) => Player.empty);

  //build the winner algo
  bool winnerCheck(
      String Player, int index, List<int> scoreboard, int gridsize) {
    //first we need to declare
    int row = index ~/ 3;
    int col = index % 3;
    int score = Player == "X" ? 1 : -1;
    scoreboard[row] += score;
    scoreboard[gridsize + col] += score;
    if (row == col) scoreboard[2 * gridsize] += score;
    if (gridsize - 1 - col == row) scoreboard[2 * gridsize + 1];

    //checking if we have 3 or -3 in the score board
    if (scoreboard.contains(3) || scoreboard.contains(-3)) {
      return true;
    }

    //by default itll return false
    return false;
  }
}
