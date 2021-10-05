import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_citizens_memory_games/src/assets.dart';
import 'package:senior_citizens_memory_games/src/screens/screens.dart';
import 'package:senior_citizens_memory_games/src/services/memory_game_service.dart';

class GameScreen extends StatelessWidget {
  static String routeName = '/game';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MemoryGameService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Game'),
        automaticallyImplyLeading:  false,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 25.0),
        child: GridView.count(
          mainAxisSpacing: 30,
          crossAxisCount: 4,
          children: List.generate(provider.imagesCard.length, (index) {
            return GestureDetector(
              onTap: () {
                provider.flipCard(index);

                if (provider.didTheGameFinish()) {
                  print('Se acabo el juego');
                  showEndGameDialog(context);
                }
              },
              child: FlipCard(
                flipOnTouch: false,
                key: provider.imagesCard[index].cardKey,
                direction: FlipDirection.HORIZONTAL, // default
                front: Container(
                  child: Container(
                    child: Image.asset(Assets.cardBackPath),
                  ),
                ),
                back: Container(
                  child: Image.asset(provider.imagesCard[index].routePath),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void showEndGameDialog(BuildContext context) {
    final provider = Provider.of<MemoryGameService>(context, listen: false);

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Memory Game'),
            content: Text('Se acabo el juego!!!! Eres excelente!!'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    provider.resetGame();
                    Navigator.of(context).pop();
                  },
                  child: Text('Reiniciar')),
              TextButton(
                onPressed: () {
                  provider.resetGame();
                  Navigator.popUntil(
                      context, ModalRoute.withName(HomeScreen.routeName));
                },
                child: Text('Volver'),
              )
            ],
          );
        });
  }
}
