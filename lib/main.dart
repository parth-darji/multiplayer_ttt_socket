import 'package:flutter/material.dart';
import 'package:flutter_ttt_socket/providers/room_data_provider.dart';
import 'package:flutter_ttt_socket/screens/main_menu_screen.dart';
import 'package:flutter_ttt_socket/utils/routes.dart';
import 'package:provider/provider.dart';

import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => RoomDataProvider(),
      child: MaterialApp(
        title: 'Tic Tac Toe',
        theme: theme,
        routes: routes,
        initialRoute: MainMenuScreen.routeName,
        home: MainMenuScreen(),
      ),
    );
  }
}
