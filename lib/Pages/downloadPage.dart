import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;
import '../Config/config.dart';
import '../Tools/NormalButton.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  void _downloadApk() {
    final apkUrl = 'assets/app-release.apk';
    html.AnchorElement(href: apkUrl)
      ..setAttribute('download', 'app-release.apk')
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Download APK"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 800;

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 100,
              vertical: isMobile ? 20 : 50,
            ),
            child: isMobile
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Take a Look at My CV",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(fontSize: 40),
                      ),
                      Text(
                        "(Best CV btw)",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: Color(0xff3a68f5),
                        ),
                      ),
                      SizedBox(height: 15),
                      customButton(
                        title: "Download Apk",
                        width: screenWidth * 0.8,
                        onPressed: _downloadApk,
                      ),
                      SizedBox(height: 30),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/webcvimage.png",
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.4,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Take a Look at My CV",
                            style: GoogleFonts.lato(
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                          Text(
                            "(Best CV btw)",
                            style: GoogleFonts.lato(
                              fontSize: screenWidth * 0.03,
                              color: Color(0xff3a68f5),
                            ),
                          ),
                          SizedBox(height: 15),
                          customButton(
                            title: "Download Apk",
                            width: screenWidth * 0.25,
                            onPressed: _downloadApk,
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/webcvimage.png",
                          width: screenWidth * 0.4,
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
