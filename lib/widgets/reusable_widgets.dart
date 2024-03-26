import 'package:flutter/material.dart';

Widget buildTextField(
    String hintText, bool isPassword, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPassword,
    enableSuggestions: !isPassword,
    autocorrect: !isPassword,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFF6EBF5D),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      hintText: hintText,
      hintStyle: const TextStyle(
        fontSize: 18,
        color: Color.fromARGB(255, 165, 165, 165),
      ),
    ),
    keyboardType:
        isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
    style: const TextStyle(color: Colors.white, fontSize: 18),
  );
}
