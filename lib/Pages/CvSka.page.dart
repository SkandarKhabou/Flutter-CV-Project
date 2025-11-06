// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mycvapp/Config/config.dart';
import 'package:mycvapp/DatabaseService/FirebaseService.dart';
import 'package:mycvapp/Tools/customContainer.dart';
import 'package:mycvapp/Tools/customText.dart';

class CvSka extends StatefulWidget {
  const CvSka({Key? key}) : super(key: key);

  @override
  State<CvSka> createState() => _CvSkaState();
}

class _CvSkaState extends State<CvSka> {
  Map<String, dynamic>? cvDataList;

  Future<void> _loadCvData() async {
    cvDataList = await FirebaseCustomService().getAllFromDoc(
      "users",
      "skandarporo@gmail.com",
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadCvData();
  }

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
                  child: customNormalText(cvDataList?["description"] ?? ''),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Row(children: [customTitle("Education")]),
                ),
                ...((cvDataList?['education'] ?? [])
                    .map(
                      (e) => buildEducationContainer(
                        e['year'],
                        e['place'],
                        e['diploma'],
                      ),
                    )
                    .toList()),

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
                          ...((cvDataList?['formation'] ?? [])
                              .map(
                                (e) => buildFormationCard(
                                  e['year'],
                                  e['platform'],
                                  e['title'],
                                  Color(int.parse(e['color'])),
                                ),
                              )
                              .toList()),
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
                        ...((cvDataList?['competence'] ?? [])
                            .map(
                              (e) => buildSkillContainer(
                                e['image'],
                                e['name'],
                                Color(int.parse(e['color'])),
                              ),
                            )
                            .toList()),
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
                      ...(cvDataList?['langue'] ?? [])
                          .map<Widget>(
                            (e) => Column(
                              children: [
                                customSubtitle(e['name'], Colors.white),
                                customNormalText(e['level'], Colors.grey),
                              ],
                            ),
                          )
                          .toList(),
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
                      Row(
                        children: [
                          customSubtitle(cvDataList?['adresse'] ?? ''),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(children: [customTitle("Phone")]),
                      Row(
                        children: [customSubtitle(cvDataList?['phone'] ?? '')],
                      ),
                      SizedBox(height: 10),
                      Row(children: [customTitle("Email")]),
                      Row(
                        children: [customSubtitle(cvDataList?['email'] ?? '')],
                      ),
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
