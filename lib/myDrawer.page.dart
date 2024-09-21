// ignore_for_file: prefer_const_constructors

import 'package:cvflutter/cvAmir.page.dart';
import 'package:cvflutter/cvSka.page.dart';
import 'package:cvflutter/localisation.page.dart';
import 'package:cvflutter/login.page.dart';
import 'package:cvflutter/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool _isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    late SharedPreferences prefs;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/drawerimage.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Cv Amir Mrabet',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: const Color(0xFF3686FF),
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CvAmir()),
              );
            },
          ),
          ListTile(
            title: Text(
              'Cv Skandar Khabou',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: const Color(0xFF3686FF),
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CvSka()),
              );
            },
          ),
          ListTile(
            title: Text(
              'Localisation Amir ',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: const Color(0xFF3686FF),
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapPage(
                      myLocation:
                          LatLng(34.746268403487285, 10.69788561013761)),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              'Localisation Skandar ',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: const Color(0xFF3686FF),
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapPage(
                      myLocation: LatLng(34.74513553713403, 10.74441891654685)),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: [
                Text(
                  'Light/Dark Mode ',
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: const Color(0xFF3686FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                InkWell(
                  child: Image.asset(
                    _isDarkMode
                        ? "assets/images/night-mode.png"
                        : "assets/images/light-mode.png",
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    setState(() {
                      _isDarkMode = !_isDarkMode;
                    });
                    themeProvider.toggleTheme();
                  },
                )
              ],
            ),
          ),
          ListTile(
            title: Container(
              height: 2,
              color: Color(0xff3586ff),
            ),
          ),
          ListTile(
            title: Text(
              'Logout',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: const Color(0xFF3686FF),
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () async {
              prefs = await SharedPreferences.getInstance();
              if (prefs.getString("username") == "googleConnected") {
                final GoogleSignIn googleSignIn = GoogleSignIn();
                await googleSignIn.signOut();
              }
              prefs.remove("connecte");
              prefs.remove("username");
              prefs.remove("password");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
