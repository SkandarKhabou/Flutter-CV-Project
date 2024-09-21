// ignore_for_file: prefer_const_constructors


import 'package:cvflutter/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            theme: themeProvider.getTheme(),
            home: SplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

enum ThemeType { Light, Dark }

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();
  ThemeType _themeType = ThemeType.Light;

  ThemeData getTheme() => _themeData;

  ThemeType getThemeType() => _themeType;

  void toggleTheme() {
    if (_themeType == ThemeType.Light) {
      _themeData = ThemeData.dark();
      _themeType = ThemeType.Dark;
    } else {
      _themeData = ThemeData.light();
      _themeType = ThemeType.Light;
    }
    notifyListeners();
  }
}
