import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ttt_socket/providers/room_data_provider.dart';
import 'package:flutter_ttt_socket/resources/socket_client.dart';
import 'package:flutter_ttt_socket/utils/utils.dart';
import 'package:provider/provider.dart';

import '../screens/game_screen.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket;

  // ------------------ EMITS ------------------ //

  void createRoom({required String nickname}) {
    if (nickname.isNotEmpty) {
      _socketClient?.emit("createRoom", {
        "nickname": nickname,
      });
    }
  }

  void joinRoom({
    required String nickname,
    required String roomId,
  }) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      _socketClient?.emit("joinRoom", {
        "nickname": nickname,
        "roomId": roomId,
      });
    }
  }

  // ------------------ LISTENERS ------------------ //

  void createRoomSuccessListener(BuildContext context) {
    _socketClient?.on("createRoomSuccess", (room) {
      log("room: $room");
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void joinRoomSuccessListener(BuildContext context) {
    _socketClient?.on("joinRoomSuccess", (room) {
      log("room: $room");
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void errorOccurredListener(BuildContext context) {
    _socketClient?.on("errorOccurred", (data) {
      showSnackbar(context, content: data);
    });
  }
}
