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
                return Container(
                  width: Game.blocSize,
                  height: Game.blocSize,
                  decoration: BoxDecoration(color: MainColor.secondaryColor),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
