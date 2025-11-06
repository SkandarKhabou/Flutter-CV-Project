import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mycvapp/Tools/customText.dart';

Widget buildEducationContainer(
  String year,
  String institution,
  String description,
) {
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
            customSubtitle(year, Colors.white),
            customNormalText(institution, Colors.white),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: const Icon(
                FontAwesomeIcons.graduationCap,
                color: Colors.black,
              ),
            ),
          ],
        ),
        customNormalText(description, Colors.grey),
      ],
    ),
  );
}

Widget buildFormationCard(
  String title,
  String subTitle,
  String year,
  Color color,
) {
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
          child: customNormalText(title),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: customNormalText(subTitle),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 15,
            top: 5,
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                child: customSubtitle(year, Colors.black),
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
    width: 110,
    height: 120,
    margin: EdgeInsets.only(right: 25),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: color,
    ),
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(image: AssetImage(imagePath), width: 50, height: 50),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: customSubtitle(label),
        ),
      ],
    ),
  );
}
