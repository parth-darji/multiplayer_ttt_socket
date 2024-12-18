import 'package:flutter/material.dart';

import '../models/player.dart';

class RoomDataProvider extends ChangeNotifier {
  Map<String, dynamic> _roomData = {};
  List<String> _displayElements = List.generate(
    9,
    (index) => "",
  );
  int _filledBoxes = 0;

  Player _player1 = Player(
    nickname: "",
    socketId: "",
    points: 0.0,
    playerType: "X",
  );

  Player _player2 = Player(
    nickname: "",
    socketId: "",
    points: 0.0,
    playerType: "O",
  );

  Map<String, dynamic> get roomData => _roomData;
  Player get player1 => _player1;
  Player get player2 => _player2;
  List<String> get displayElements => _displayElements;

  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }

  void updatePlayer1(
    Map<String, dynamic> data,
  ) {
    _player1 = Player.fromJson(data);
    notifyListeners();
  }

  void updatePlayer2(
    Map<String, dynamic> data,
  ) {
    _player2 = Player.fromJson(data);
    notifyListeners();
  }

  void updateDisplayElement(
    int index,
    String choice,
  ) {
    _displayElements[index] = choice;
    _filledBoxes++;
    notifyListeners();
  }
}
