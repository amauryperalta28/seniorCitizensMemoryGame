import 'package:flutter/material.dart';
import 'package:senior_citizens_memory_games/src/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Senior Citizens memory games',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => new HomeScreen(),
        GameScreen.routeName: (context) => new GameScreen(),
      },
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue.shade700,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue.shade700,
        ),
      ),
    );
  }
}
