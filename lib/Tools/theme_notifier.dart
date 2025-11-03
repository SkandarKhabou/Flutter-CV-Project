import 'package:flutter/material.dart';

// Global theme notifier for the whole app
ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
bool get isDarkMode => themeNotifier.value == ThemeMode.dark;