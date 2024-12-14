import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ttt_socket/providers/room_data_provider.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  static String routeName = "/game";
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    log("player1: ${Provider.of<RoomDataProvider>(context).player1.toJson()}");
    log("player2: ${Provider.of<RoomDataProvider>(context).player2.toJson()}");
    return Scaffold(
      body: Center(
        child: Text(
          Provider.of<RoomDataProvider>(context).roomData.toString(),
        ),
      ),
    );
  }
}
