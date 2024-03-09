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
}
