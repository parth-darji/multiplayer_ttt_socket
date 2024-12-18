import 'dart:developer';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;

  static SocketClient? _instance;
  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }

  SocketClient._internal() {
    socket = IO.io('http://192.168.1.11:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    log("socket connected 1: ${socket?.connected}");
    socket!.connect();
    log("socket connected 2: ${socket?.connected}");
  }
}
