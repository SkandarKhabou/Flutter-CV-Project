// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycvapp/Pages/Login.page.dart';
import 'package:mycvapp/Tools/NormalButton.dart';
import 'package:mycvapp/Tools/ThemeButton.dart';
import 'package:mycvapp/Tools/customText.dart';
import 'package:mycvapp/Pages/CvSka.page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CvSka()),
                );
              },
              child: Image.asset(
                'assets/images/pic.png',
                height: 250,
                width: 250,
              ),
            ),
            customTitle("Skandar Khabou", Color(0xFF3686FF)),
            customSubtitle("El Magnificos"),
            themeToggleButton(),
            customButton(
              title: "Logout",
              width: 200,
              height: 50,
              color: Colors.blueAccent,
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
