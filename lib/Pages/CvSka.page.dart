// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mycvapp/Config/config.dart';
import 'package:mycvapp/Tools/customContainer.dart';
import 'package:mycvapp/Tools/customText.dart';

class CvSka extends StatelessWidget {
  const CvSka({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Image.asset('assets/images/pic.png', height: 250, width: 250),
                SizedBox(height: 20),
                customTitle("Skandar Khabou", Color(0xFF3686FF)),
                customSubtitle("Ingénieur en Informatique"),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(children: [customTitle("Profil")]),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF5bdde5),
                  ),
                  child: customNormalText(
                    "Étudiant en deuxième année de génie informatique, je suis passionné par l'ingénierie logicielle et la science des données. Mon engagement envers l'excellence me pousse à chercher continuellement de nouveaux défis afin de bien exploiter les compétences que j'ai acquises.",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Row(children: [customTitle("Education")]),
                ),
                buildEducationContainer(
                  "2022 - Présent",
                  "IIT",
                  "Genie Informatique | Sfax",
                ),
                buildEducationContainer(
                  "2019 - 2022",
                  "FSEG ",
                  "Programme d'Informatique Appliquée à la Gestion | Sfax",
                ),
                buildEducationContainer(
                  "2019",
                  "Lycée 15 Novembre 1955",
                  "Baccalauréat en Sciences Expérimentales  | Sfax",
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(children: [customTitle("Formation")]),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: <Widget>[
                          buildFormationCard(
                            "Udemy",
                            "Flutter development bootcamp with Dart",
                            "2020",
                            const Color(0xFFFFABC8),
                          ),
                          buildFormationCard(
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
                  child: Row(children: [customTitle("Expérience")]),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.all(20),
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
                        child: Icon(
                          FontAwesomeIcons.pencilRuler,
                          color: Colors.black,
                        ),
                      ),
                      customSubtitle("Freelancer", Colors.white),
                      customSubtitle("Flutter & Devops", Colors.white),
                      customSubtitle("2020-Présent", Colors.white),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Row(children: [customTitle("Compétence")]),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.all(20),
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
                        buildSkillContainer(
                          "assets/images/html.png",
                          "HTML",
                          Colors.orange.shade300,
                        ),
                        buildSkillContainer(
                          "assets/images/css.png",
                          "CSS",
                          Colors.blue.shade300,
                        ),
                        buildSkillContainer(
                          "assets/images/js.png",
                          "JavaScript",
                          Colors.yellow.shade300,
                        ),
                        buildSkillContainer(
                          "assets/images/bs.png",
                          "BootStrap",
                          Colors.purple.shade300,
                        ),
                        buildSkillContainer(
                          "assets/images/c.png",
                          "C",
                          Colors.blue.shade500,
                        ),
                        buildSkillContainer(
                          "assets/images/dart.png",
                          "Dart",
                          Colors.cyanAccent,
                        ),
                        buildSkillContainer(
                          "assets/images/flutter.png",
                          "Flutter",
                          Colors.blue.shade500,
                        ),
                        buildSkillContainer(
                          "assets/images/sql.png",
                          "SQL",
                          Colors.blue[200]!,
                        ),
                        buildSkillContainer(
                          "assets/images/PHP.png",
                          "PHP",
                          Colors.deepPurpleAccent.shade400,
                        ),
                        buildSkillContainer(
                          "assets/images/illustrator.png",
                          "illustrator",
                          Colors.brown[700]!,
                        ),
                        buildSkillContainer(
                          "assets/images/After.png",
                          "After Effects",
                          Colors.purpleAccent[200]!,
                        ),
                        buildSkillContainer(
                          "assets/images/Premiere.png",
                          "Premiere",
                          Colors.pink[200]!,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Row(
                    children: [customTitle("Compétence Linguistique")],
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
                            customSubtitle("Arabe", Colors.white),
                            customNormalText("Native", Colors.grey),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            customSubtitle("Francais", Colors.white),
                            customNormalText("Conversational", Colors.grey),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            customSubtitle("Anglais", Colors.white),
                            customNormalText("Conversational", Colors.grey),
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
                      Row(children: [customTitle("Adresse")]),
                      Row(children: [customSubtitle("Rte. Ain Km 1.5, Sfax")]),
                      SizedBox(height: 10),
                      Row(children: [customTitle("Phone")]),
                      Row(children: [customSubtitle("+216 93 519 878")]),
                      SizedBox(height: 10),
                      Row(children: [customTitle("Email")]),
                      Row(children: [customSubtitle("skandarporo@gmail.com")]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
