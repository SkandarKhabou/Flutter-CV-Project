import 'package:flutter/material.dart';

// Generic button function with title
Widget customButton({
  required String title,
  required VoidCallback onPressed,
  double width = 200,
  double height = 50,
  Color color = Colors.blueAccent,
  TextStyle? textStyle,
  double borderRadius = 8,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style:
            textStyle ??
            TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
      ),
    ),
  );
}

// customButton(
//   title: 'Click Me',
//   width: 200,
//   height: 50,
//   color: Colors.blueAccent,
//   onPressed: () {
//     print('Button pressed!');
//   },
// )
