import "package:animated_splash_screen/animated_splash_screen.dart";
import "package:cvflutter/login.page.dart";
import "package:cvflutter/welcome.page.dart";
import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:shared_preferences/shared_preferences.dart";

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 400,
        backgroundColor: Colors.blueAccent,
        nextScreen: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
            if (snapshot.hasData) {
              bool conn = snapshot.data?.getBool('connecte') ?? false;
              if (conn) {
                return WelcomePage();
              } else {
                return LoginPage();
              }
            } else {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
        splash: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: LottieBuilder.asset(
                    "assets/lottie/AnimationSplashScreen.json"),
              )
            ],
          ),
        ));
  }
}
