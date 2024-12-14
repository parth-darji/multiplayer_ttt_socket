import 'package:flutter/material.dart';
import 'package:flutter_ttt_socket/responsive/responsive.dart';
import 'package:flutter_ttt_socket/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onPressed: () {},
              buttonText: "Create Room",
            ),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () {},
              buttonText: "Join Room",
            ),
          ],
        ),
      ),
    );
  }
}
