import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_citizens_memory_games/src/screens/screens.dart';
import 'package:senior_citizens_memory_games/src/services/memory_game_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new MemoryGameService(),
        )
      ],
      child: MaterialApp(
        title: 'Senior Citizens memory games',
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => new HomeScreen(),
          GameScreen.routeName: (context) => new GameScreen(),
        },
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.blue.shade800,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blue.shade700,
          ),
        ),
      ),
    );
  }
}
