// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cvflutter/myDrawer.page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CvSka extends StatelessWidget {
  const CvSka({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Image.asset(
                  'assets/images/pic.png',
                  height: 250,
                  width: 250,
                ),
                SizedBox(height: 20),
                Text(
                  "Skandar Khabou",
                  style: GoogleFonts.lato(
                    fontSize: 27,
                    color: const Color(0xFF3686FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Futur Ingénieur",
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    color: const Color(0xFF74767D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        "Profil",
                        style: GoogleFonts.merriweatherSans(
                          fontSize: 22,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF5bdde5),
                  ),
                  child: Text(
                    "Étudiant en deuxième année de génie informatique, je suis passionné par l'ingénierie logicielle et la science des données. "
                    "Mon engagement envers l'excellence me pousse à chercher continuellement de nouveaux défis afin de bien exploiter les compétences que j'ai acquises.",
                    style: const TextStyle(
                      color: Color(0xFF2C352D),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Row(
                    children: [
                      Text(
                        "Education",
                        style: GoogleFonts.merriweatherSans(
                          fontSize: 22,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                buildEducationContainer(
                  context,
                  "2022 - Présent",
                  "IIT",
                  "Genie Informatique | Sfax",
                ),
                buildEducationContainer(
                  context,
                  "2019 - 2022",
                  "FSEG ",
                  "Programme d'Informatique Appliquée à la Gestion | Sfax",
                ),
                buildEducationContainer(
                  context,
                  "2019",
                  "Lycée 15 Novembre 1955",
                  "Baccalauréat en Sciences Expérimentales  | Sfax",
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        "Formation",
                        style: GoogleFonts.merriweatherSans(
                          fontSize: 22,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: <Widget>[
                          buildFormationCard(
                            context,
                            "Udemy",
                            "Flutter development bootcamp with Dart",
                            "2020",
                            const Color(0xFFFFABC8),
                          ),
                          buildFormationCard(
                            context,
                            "Udemy",
                            "Formation Complète Développeur Web",
                            "2019",
                            const Color(0xFF7768D8),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Row(
                    children: [
                      Text(
                        "Experience",
                        style: GoogleFonts.merriweatherSans(
                          fontSize: 22,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFDE4C2A),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Icon(FontAwesomeIcons.pencilRuler,
                            color: Colors.black),
                      ),
                      Text(
                        "Freelancer",
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Flutter & Devops",
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "2020-Présent",
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Row(
                    children: [
                      Text(
                        "Compétence",
                        style: GoogleFonts.merriweatherSans(
                          fontSize: 22,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF16181D),
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        buildSkillContainer("assets/images/html.png", "HTML",
                            Colors.orange.shade300),
                        buildSkillContainer("assets/images/css.png", "CSS",
                            Colors.blue.shade300),
                        buildSkillContainer("assets/images/js.png",
                            "JavaScript", Colors.yellow.shade300),
                        buildSkillContainer("assets/images/bs.png", "BootStrap",
                            Colors.purple.shade300),
                        buildSkillContainer(
                            "assets/images/c.png", "C", Colors.blue.shade500),
                        buildSkillContainer("assets/images/dart.png", "Dart",
                            Colors.cyanAccent),
                        buildSkillContainer("assets/images/flutter.png",
                            "Flutter", Colors.blue.shade500),
                        buildSkillContainer(
                            "assets/images/sql.png", "SQL", Colors.blue[200]!),
                        buildSkillContainer("assets/images/PHP.png", "PHP",
                            Colors.deepPurpleAccent.shade400),
                        buildSkillContainer("assets/images/illustrator.png",
                            "illustrator", Colors.brown[700]!),
                        buildSkillContainer("assets/images/After.png",
                            "After Effects", Colors.purpleAccent[200]!),
                        buildSkillContainer("assets/images/Premiere.png",
                            "Premiere", Colors.pink[200]!),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Row(
                    children: [
                      Text(
                        "Compétence Linguistique",
                        style: GoogleFonts.merriweatherSans(
                          fontSize: 22,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF16181D),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Arabe",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Native",
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                color: Color(0xFF6E717E),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Francais",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              " Conversational",
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                color: Color(0xFF6E717E),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Anglais",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Conversational",
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                color: Color(0xFF6E717E),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1000,
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: Color(0xFF8AC185),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Adresse",
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Rte. Ain Km 1.5, Sfax",
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              color: Color(0xFF4E634E),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Text(
                              "Phone",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "+216 93 519 878",
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              color: Color(0xFF4E634E),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Text(
                              "Email",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "skandarporo@gmail.com",
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              color: Color(0xFF4E634E),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEducationContainer(BuildContext context, String year,
      String institution, String description) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF16181D),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                year,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                institution,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: const Icon(FontAwesomeIcons.graduationCap,
                    color: Colors.black),
              ),
            ],
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF6E717E),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFormationCard(BuildContext context, String title, String subTitle,
      String year, Color color) {
    return Container(
      width: 180,
      height: 150,
      margin: const EdgeInsets.only(right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF2C352D),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              subTitle,
              style: GoogleFonts.lato(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 5),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  child: Text(
                    year,
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSkillContainer(String imagePath, String label, Color color) {
    return Container(
      width: 90,
      height: 105,
      margin: EdgeInsets.only(right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(imagePath),
              width: 50,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              label,
              style: GoogleFonts.lato(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
