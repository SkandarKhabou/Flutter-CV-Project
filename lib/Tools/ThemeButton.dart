import 'package:flutter/material.dart';
import 'theme_notifier.dart'; // <-- import the global notifier

Widget themeToggleButton() {
  return ValueListenableBuilder<ThemeMode>(
    valueListenable: themeNotifier,
    builder: (_, currentMode, __) {
      return IconButton(
        icon: Icon(
          currentMode == ThemeMode.dark ? Icons.wb_sunny : Icons.nightlight_round,
        ),
        onPressed: () {
          // Toggle the global theme
          themeNotifier.value =
              currentMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
        },
      );
    },
  );
}
