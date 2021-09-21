import 'package:flutter/material.dart';
import 'package:senior_citizens_memory_games/src/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memory Games for the old.'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              child: Container(
                height: 50,
                width: 200,
                child: Text(
                  'Start',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                alignment: Alignment.center,
              ),
              textColor: Colors.white,
              color: Colors.blue.shade700,
              onPressed: () {
                Navigator.of(context).pushNamed(GameScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
