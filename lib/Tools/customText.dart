import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycvapp/Tools/theme_notifier.dart';

// 🏷️ Title text
Widget customTitle(String text, [Color? color]) {
  return Text(
    text,
    style: GoogleFonts.lato(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
    ),
  );
}

// 🏷️ Subtitle text
Widget customSubtitle(String text, [Color? color]) {
  return Text(
    text,
    style: GoogleFonts.lato(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: color ?? (isDarkMode ? Colors.grey[300] : Colors.grey[700]),
    ),
  );
}

// 🏷️ Normal paragraph text
Widget customNormalText(String text, [Color? color]) {
  return Text(
    text,
    style: GoogleFonts.lato(
      fontSize: 14,
      color: color ?? (isDarkMode ? Colors.grey[200] : Colors.black87),
    ),
  );
}
