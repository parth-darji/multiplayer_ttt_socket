import 'package:flutter/material.dart';
import 'package:flutter_ttt_socket/providers/room_data_provider.dart';
import 'package:flutter_ttt_socket/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({super.key});

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  final roomIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    roomIdController.text =
        Provider.of<RoomDataProvider>(context, listen: false).roomData["_id"];
  }

  @override
  void dispose() {
    roomIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Waiting for a player to join!"),
        SizedBox(height: 20),
        CustomTextfield(
          controller: roomIdController,
          hintText: "",
        ),
      ],
    );
  }
}
