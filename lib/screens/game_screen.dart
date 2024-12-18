import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ttt_socket/providers/room_data_provider.dart';
import 'package:flutter_ttt_socket/resources/socket_methods.dart';
import 'package:flutter_ttt_socket/views/tic_tac_toe_board.dart';
import 'package:flutter_ttt_socket/views/waiting_lobby.dart';
import 'package:provider/provider.dart';

import '../views/scoreboard.dart';

class GameScreen extends StatefulWidget {
  static String routeName = "/game";
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
  }

  @override
  Widget build(BuildContext context) {
    log("player1: ${Provider.of<RoomDataProvider>(context).player1.toJson()}");
    log("player2: ${Provider.of<RoomDataProvider>(context).player2.toJson()}");

    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Scaffold(
      body: roomDataProvider.roomData["isJoin"]
          ? const WaitingLobby()
          : SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Scoreboard(),
                  TicTacToeBoard(),
                  Text(
                    "${roomDataProvider.roomData["turn"]["nickname"]}'s turn",
                    style: TextStyle(
                      color: Colors.white,
                      shadows: roomDataProvider.roomData["turn"]["socketId"] !=
                              _socketMethods.socketClient.id
                          ? [
                              Shadow(
                                blurRadius: 40,
                                color: Colors.deepPurple,
                              ),
                            ]
                          : null,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
