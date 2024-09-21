import 'package:cvflutter/cvAmir.page.dart';
import 'package:cvflutter/cvSka.page.dart';
import 'package:cvflutter/myDrawer.page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Builder(builder: (context) {
                    return IconButton(
                      icon: Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  }),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CvAmir()),
                );
              },
              child: Image.asset(
                'assets/images/picAmir.png',
                height: 250,
                width: 250,
              ),
            ),
            Text(
              "Amir Mrabet",
              style: GoogleFonts.lato(
                fontSize: 27,
                color: const Color(0xFF3686FF),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "El Capo ",
              style: GoogleFonts.lato(
                fontSize: 18,
                color: const Color(0xFF74767D),
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 2,
              color: Colors.blue,
              margin: EdgeInsets.symmetric(vertical: 20),
            ),
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
            Text(
              "Skandar Khabou",
              style: GoogleFonts.lato(
                fontSize: 27,
                color: const Color(0xFF3686FF),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "El Magnificos",
              style: GoogleFonts.lato(
                fontSize: 18,
                color: const Color(0xFF74767D),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
