import 'package:flutter/material.dart';

// Generic button function with title
Widget customButton({
  required String title,          // Button text
  required double width,          // Width of the button
  required double height,         // Height of the button
  required Color color,           // Background color
  required VoidCallback onPressed,// Function called on press
  TextStyle? textStyle,           // Optional text style
}) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: textStyle ??
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
