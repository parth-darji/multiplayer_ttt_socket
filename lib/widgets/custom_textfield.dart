import 'package:flutter/material.dart';
import 'package:flutter_ttt_socket/utils/colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isReadOnly;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: TextField(
        readOnly: isReadOnly,
        controller: controller,
        decoration: InputDecoration(
          fillColor: bgColor,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
