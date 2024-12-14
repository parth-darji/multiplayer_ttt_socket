import 'package:flutter/material.dart';
import 'package:flutter_ttt_socket/screens/main_menu_screen.dart';
import 'package:flutter_ttt_socket/utils/colors.dart';
import 'package:flutter_ttt_socket/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
      ),
      routes: routes,
      initialRoute: MainMenuScreen.routeName,
      home: MainMenuScreen(),
    );
  }
}
