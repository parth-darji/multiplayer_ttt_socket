import 'package:flutter/material.dart';

import '../responsive/responsive.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = "join-room";
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final _nameController = TextEditingController();
  final _gameIdController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _gameIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                shadows: [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.deepPurple,
                  ),
                ],
                text: "Join Room",
                fontSize: 70,
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextfield(
                controller: _nameController,
                hintText: "Enter your nickname",
              ),
              SizedBox(height: 20),
              CustomTextfield(
                controller: _gameIdController,
                hintText: "Enter Game ID",
              ),
              SizedBox(height: size.height * 0.045),
              CustomButton(
                onPressed: () {},
                buttonText: "Join",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
