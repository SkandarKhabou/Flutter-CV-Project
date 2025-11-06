import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;
import 'package:mycvapp/Config/config.dart';
import 'package:mycvapp/Tools/NormalButton.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  void _downloadApk() {
    // Replace with the path to your APK inside "web" folder
    final apkUrl = 'assets/app-release.apk';

    final anchor = html.AnchorElement(href: apkUrl)
      ..setAttribute('download', 'app-release.apk')
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Download APK"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Take a Look at My CV",
                  style: GoogleFonts.lato(fontSize: 70),
                ),
                Text(
                  "(Best CV btw)",
                  style: GoogleFonts.lato(
                    fontSize: 40,
                    color: Color(0xff3a68f5),
                  ),
                ),
                SizedBox(height: 15),
                customButton(
                  title: "Download Apk",
                  width: 450,
                  onPressed: _downloadApk,
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/webcvimage.png",
                width: screenWidth(context) * 0.4,
                height: screenHeight(context) * 0.7,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
