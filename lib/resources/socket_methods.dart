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

  // this will listen the create room success socket
  void createRoomSuccessListener(BuildContext context) {
    _socketClient?.on("createRoomSuccess", (room) {
      log("room: $room");
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  // this will listen the join room success socket
  void joinRoomSuccessListener(BuildContext context) {
    _socketClient?.on("joinRoomSuccess", (room) {
      log("room: $room");
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  // this will listen the join room success socket
  void updateRoomListener(BuildContext context) {
    _socketClient?.on("updateRoom", (room) {
      log("room: $room");
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
    });
  }

  // this will listen the error occured socket
  void errorOccurredListener(BuildContext context) {
    _socketClient?.on("errorOccurred", (data) {
      showSnackbar(context, content: data);
    });
  }

  // this will listen the update players state socket
  void updatePlayersStateListener(BuildContext context) {
    _socketClient?.on("updatePlayers", (playerData) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer1(playerData[0]);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer2(playerData[1]);
    });
  }
}
