import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_citizens_memory_games/src/services/memory_game_service.dart';

class GameScreen extends StatelessWidget {
  static String routeName = '/game';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MemoryGameService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Game'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 25.0),
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 4,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(provider.imagesCard.length, (index) {
            return FlipCard(
              onFlip: (){
                 provider.flipCard(index);
              },
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                child: Center(child: Text('Back')),
              ),
              back: Container(
                child: Image.asset(provider.imagesCard[index].routePath),
              ),
            );
          }),
        ),
      ),
    );
  }
}

