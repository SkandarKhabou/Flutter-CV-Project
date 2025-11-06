// ignore_for_file: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mycvapp/Pages/Login.page.dart';
import 'package:mycvapp/Pages/Welcome.page.dart';
import 'package:mycvapp/Pages/downloadPage.dart';
import 'package:mycvapp/firebase_options.dart';
import 'Config/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: currentMode, // reacts to notifier
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: kIsWeb ? DownloadPage() : LoginPage(),
        );
      },
    );
  }
}
