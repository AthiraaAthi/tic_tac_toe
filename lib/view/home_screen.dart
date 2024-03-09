import 'package:flutter/material.dart';
import 'package:tic_tac_toe/controller/game_logic.dart';
import 'package:tic_tac_toe/utils/color_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //adding necessary variables
  String lastValue = "X";
  bool gameOver = false;
  List<int> scoreboard = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ]; //this score are for the different combination of the games'[row1,2,3]
  int turn = 0; //to check the draw
  String result = "";

  Game game = Game();

  //creating gamke board
  @override
  void initState() {
    super.initState();
    game.board = Game.initGameBoard();
    print(game.board);
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Its ${lastValue} turn ".toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: boardWidth,
            height: boardWidth,
            child: GridView.count(
              crossAxisCount: Game.boardLength ~/
                  3, //  ~/ allows to devide to integer & return an int as result
              padding: EdgeInsets.all(16.0),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(Game.boardLength, (index) {
                return InkWell(
                  onTap: gameOver
                      ? null
                      : () {
                          if (game.board![index] ==
                              "") //if "X" each time click can replace the values
                          {
                            setState(() {
                              game.board![index] = lastValue;
                              turn++; /////////////////
                              gameOver = game.winnerCheck(
                                  lastValue, index, scoreboard, 3); //////
                              if (gameOver) {
                                result = "$lastValue is the winner";
                              } else if (!gameOver && turn == 9) {
                                result = "Its a Draw!";
                                gameOver = true;
                              }

                              if (lastValue == "X")
                                lastValue = "O";
                              else
                                lastValue = "X";
                            });
                          }
                        },
                  child: Container(
                    width: Game.blocSize,
                    height: Game.blocSize,
                    decoration: BoxDecoration(
                      color: MainColor.secondaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        game.board![index],
                        style: TextStyle(
                          color: game.board![index] == "X"
                              ? Colors.blue
                              : Colors.red,
                          fontSize: 64.0,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            result,
            style: TextStyle(color: Colors.white, fontSize: 54),
          ), //////
          ElevatedButton.icon(
            label: Text("Repeat the game"),
            onPressed: () {
              setState(() {
                //erase the board
                game.board = Game.initGameBoard();
                lastValue = "X";
                gameOver = false;
                turn = 0; ///////
                result = "";
                scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
              });
            },
            icon: Icon(
              Icons.replay,
              size: 30,
              color: MainColor.accentColor,
            ),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(MainColor.secondaryColor)),
          )
        ],
      ),
    );
  }
}
