import 'package:flutter/material.dart';
import 'package:flutter_ttt_socket/providers/room_data_provider.dart';
import 'package:flutter_ttt_socket/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

class GameMethods {
  void checkWinner(
    BuildContext context,
    Socket socketClient,
  ) {
    final roomDataProvider =
        Provider.of<RoomDataProvider>(context, listen: false);

    String winner = ""; // X or O

    // Checking rows
    if (roomDataProvider.displayElements[0] ==
            roomDataProvider.displayElements[1] &&
        roomDataProvider.displayElements[0] ==
            roomDataProvider.displayElements[2] &&
        roomDataProvider.displayElements[0] != '') {
      winner = roomDataProvider.displayElements[0];
    }
    if (roomDataProvider.displayElements[3] ==
            roomDataProvider.displayElements[4] &&
        roomDataProvider.displayElements[3] ==
            roomDataProvider.displayElements[5] &&
        roomDataProvider.displayElements[3] != '') {
      winner = roomDataProvider.displayElements[3];
    }
    if (roomDataProvider.displayElements[6] ==
            roomDataProvider.displayElements[7] &&
        roomDataProvider.displayElements[6] ==
            roomDataProvider.displayElements[8] &&
        roomDataProvider.displayElements[6] != '') {
      winner = roomDataProvider.displayElements[6];
    }

    // Checking Column
    if (roomDataProvider.displayElements[0] ==
            roomDataProvider.displayElements[3] &&
        roomDataProvider.displayElements[0] ==
            roomDataProvider.displayElements[6] &&
        roomDataProvider.displayElements[0] != '') {
      winner = roomDataProvider.displayElements[0];
    }
    if (roomDataProvider.displayElements[1] ==
            roomDataProvider.displayElements[4] &&
        roomDataProvider.displayElements[1] ==
            roomDataProvider.displayElements[7] &&
        roomDataProvider.displayElements[1] != '') {
      winner = roomDataProvider.displayElements[1];
    }
    if (roomDataProvider.displayElements[2] ==
            roomDataProvider.displayElements[5] &&
        roomDataProvider.displayElements[2] ==
            roomDataProvider.displayElements[8] &&
        roomDataProvider.displayElements[2] != '') {
      winner = roomDataProvider.displayElements[2];
    }

    // Checking Diagonal
    if (roomDataProvider.displayElements[0] ==
            roomDataProvider.displayElements[4] &&
        roomDataProvider.displayElements[0] ==
            roomDataProvider.displayElements[8] &&
        roomDataProvider.displayElements[0] != '') {
      winner = roomDataProvider.displayElements[0];
    }
    if (roomDataProvider.displayElements[2] ==
            roomDataProvider.displayElements[4] &&
        roomDataProvider.displayElements[2] ==
            roomDataProvider.displayElements[6] &&
        roomDataProvider.displayElements[2] != '') {
      winner = roomDataProvider.displayElements[2];
    } else if (roomDataProvider.filledBoxes == 9) {
      winner = "";
      showGameDialog(
        context,
        text: "Draw",
      );
    }

    if (winner != "") {
      if (roomDataProvider.player1.playerType == winner) {
        showGameDialog(
          context,
          text: "${roomDataProvider.player1.nickname} won!",
        );
        socketClient.emit("winner", {
          "winnerSocketId": roomDataProvider.player1.socketId,
          "roomId": roomDataProvider.roomData["_id"],
        });
      } else {
        showGameDialog(
          context,
          text: "${roomDataProvider.player2.nickname} won!",
        );
        socketClient.emit("winner", {
          "winnerSocketId": roomDataProvider.player2.socketId,
          "roomId": roomDataProvider.roomData["_id"],
        });
      }
    }
  }

  void clearBoard(
    BuildContext context,
  ) {
    final roomDataProvider =
        Provider.of<RoomDataProvider>(context, listen: false);

    for (int i = 0; i < roomDataProvider.displayElements.length; i++) {
      roomDataProvider.updateDisplayElement(i, "");
    }

    roomDataProvider.setFilledBoxToO();
  }
}
