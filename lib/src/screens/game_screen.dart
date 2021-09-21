import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
   static String routeName = '/game';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Game'),
       ),
       body: Container(
         child: Text('Game'),
       ),
    );
  }
}