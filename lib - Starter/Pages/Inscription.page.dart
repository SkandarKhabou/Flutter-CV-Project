import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mycvapp/Config/config.dart';
import 'package:mycvapp/Pages/login.page.dart';
import 'package:mycvapp/Pages/welcome.page.dart';
import 'package:mycvapp/Tools/FormHelper.dart';
import 'package:mycvapp/Tools/NormalButton.dart';
import 'package:mycvapp/Tools/customText.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight(context),
          width: screenWidth(context),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Color.fromARGB(255, 183, 218, 234)],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -120,
                right: -100,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff7377ff),
                  ),
                ),
              ),
              Positioned(
                top: -100,
                right: 150,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff66baff),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/avatar.png",
                          ),
                          radius: 50,
                          backgroundColor: Colors.blue,
                        ),
                        SizedBox(height: 20),
                        customTextFormField(
                          myLabel: "Full Name",
                          controller: _fullNameController,
                        ),
                        SizedBox(height: 20),
                        customTextFormField(
                          myLabel: "Email",
                          controller: _emailController,
                        ),
                        SizedBox(height: 20),
                        customTextFormField(
                          myLabel: "Password",
                          controller: _passwordController,
                          isPassword: true,
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: customNormalText(
                            "I already have an account !",
                            Color(0xff41a8f5),
                          ),
                        ),
                        customButton(
                          title: "Sign In",
                          height: 45,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signUp();
                            }
                          },
                          borderRadius: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _emailController.text.toLowerCase().trim(),
            password: _passwordController.text.trim(),
          );

      User? user = userCredential.user;
      if (user != null) {
        await user.sendEmailVerification();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(_emailController.text.toLowerCase().trim())
            .set({'Full Name': _fullNameController.text.trim()});
      }

      // ✅ Show dialog first
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Registration Successful'),
          content: const Text("We've sent you a verification email."),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // close dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Registration Error'),
          content: Text(e.message ?? 'An error occurred during registration.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }
}
