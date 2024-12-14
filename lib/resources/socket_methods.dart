import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ttt_socket/providers/room_data_provider.dart';
import 'package:flutter_ttt_socket/resources/socket_client.dart';
import 'package:provider/provider.dart';

import '../screens/game_screen.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket;

  void createRoom({required String nickname}) {
    if (nickname.isNotEmpty) {
      _socketClient?.emit("createRoom", {
        "nickname": nickname,
      });
    }
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient?.on("createRoomSuccess", (room) {
      log("room: $room");
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }
}