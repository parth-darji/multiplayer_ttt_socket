import 'package:flutter/material.dart';
import 'package:flutter_ttt_socket/responsive/responsive.dart';
import 'package:flutter_ttt_socket/screens/create_room_screen.dart';
import 'package:flutter_ttt_socket/screens/join_room_screen.dart';
import 'package:flutter_ttt_socket/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = "/main-menu";
  const MainMenuScreen({super.key});

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onPressed: () => createRoom(context),
              buttonText: "Create Room",
            ),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () => joinRoom(context),
              buttonText: "Join Room",
            ),
          ],
        ),
      ),
    );
  }
}
