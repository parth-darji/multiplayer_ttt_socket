import 'package:flutter_ttt_socket/resources/socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket;

  void createRoom({required String nickname}) {
    if (nickname.isNotEmpty) {
      _socketClient?.emit("createRoom", {
        "nickname": nickname,
      });
    }
  }
}
