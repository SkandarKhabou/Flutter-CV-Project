import 'package:flutter/material.dart';

Widget customTextFormField({
  required String myLabel,
  required TextEditingController controller,
  Color backgroundColor = const Color(0xFF9195FF),
  bool isPassword = false,
  String? regexPattern,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword,
    decoration: InputDecoration(
      filled: true,
      fillColor: backgroundColor,
      labelText: myLabel,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'This field is empty!';
      }
      if (regexPattern != null && !RegExp(regexPattern).hasMatch(value)) {
        return 'Invalid format';
      }
      return null;
    },
  );
}
