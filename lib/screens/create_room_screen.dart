import 'package:flutter/material.dart';
import 'package:flutter_ttt_socket/resources/socket_methods.dart';
import 'package:flutter_ttt_socket/responsive/responsive.dart';
import 'package:flutter_ttt_socket/widgets/custom_button.dart';
import 'package:flutter_ttt_socket/widgets/custom_text.dart';
import 'package:flutter_ttt_socket/widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = "create-room";
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final _nameController = TextEditingController();
  final _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
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
                text: "Create Room",
                fontSize: 70,
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextfield(
                controller: _nameController,
                hintText: "Enter your nickname",
              ),
              SizedBox(height: size.height * 0.045),
              CustomButton(
                onPressed: () {
                  _socketMethods.createRoom(
                    nickname: _nameController.text.trim(),
                  );
                },
                buttonText: "Create",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
