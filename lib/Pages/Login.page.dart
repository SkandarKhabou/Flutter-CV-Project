import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mycvapp/Config/config.dart';
import 'package:mycvapp/Pages/Inscription.page.dart';
import 'package:mycvapp/Pages/welcome.page.dart';
import 'package:mycvapp/Tools/FormHelper.dart';
import 'package:mycvapp/Tools/NormalButton.dart';
import 'package:mycvapp/Tools/customText.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String _signinErrorMessage = "";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [Colors.white, Color.fromARGB(255, 183, 218, 234)],
          ),
        ),
        child: SizedBox(
          height: screenHeight(context),
          child: SingleChildScrollView(
            child: Center(
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
                      padding: EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/kid.png",
                              ),
                              radius: 50,
                              backgroundColor: Colors.blue,
                            ),
                            SizedBox(height: 20),
                            // Username Field
                            customTextFormField(
                              myLabel: "Email",
                              controller: _emailController,
                            ),
                            SizedBox(height: 20),
                            // Password Field
                            customTextFormField(
                              myLabel: "Password",
                              controller: _passwordController,
                              isPassword: true,
                            ),
                            SizedBox(height: 20),
                            // Remember Me + Signup link
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  activeColor: Color(0xff41a8f5),
                                  value: _rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value!;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Color(0xff41a8f5)),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                customNormalText(
                                  'Remember me',
                                  Color(0xff41a8f5),
                                ),
                                Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => InscriptionPage(),
                                      ),
                                    );
                                  },
                                  child: customNormalText(
                                    "Don't have an account?",
                                    Color(0xff41a8f5),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            // Sign In Button
                            customButton(
                              title: "Sign In",
                              height: 45,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  signIn();
                                }
                              },
                              borderRadius: 20,
                            ),
                            customSubtitle(_signinErrorMessage),
                            SizedBox(height: 10),
                            // Forgot Password
                            TextButton(
                              onPressed: () {
                                final TextEditingController emailController =
                                    TextEditingController();

                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Reset Password"),
                                    content: TextField(
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        hintText: "Enter your email",
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("Cancel"),
                                      ),

                                      TextButton(
                                        onPressed: () async {
                                          String email = emailController.text
                                              .trim();

                                          if (email.isEmpty) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  "Please enter your email",
                                                ),
                                              ),
                                            );
                                            return;
                                          }

                                          try {
                                            await FirebaseAuth.instance
                                                .sendPasswordResetEmail(
                                                  email: email,
                                                );

                                            Navigator.pop(context);

                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  "Password reset link sent. Check your email.",
                                                ),
                                              ),
                                            );
                                          } on FirebaseAuthException catch (e) {
                                            String message =
                                                "Something went wrong";

                                            if (e.code == 'user-not-found') {
                                              message =
                                                  "No account found with this email";
                                            }

                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(content: Text(message)),
                                            );
                                          }
                                        },
                                        child: const Text("Send"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: customNormalText(
                                "Forgot Password ?",
                                Colors.black,
                              ),
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
        ),
      ),
    );
  }

  Future<void> signIn() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: _emailController.text.toLowerCase().trim(),
            password: _passwordController.text.trim(),
          );
      final user = userCredential.user;
      if (user == null) {
        setState(() {
          _signinErrorMessage = "User not found !";
        });
        return;
      }
      if (!user.emailVerified) {
        setState(() {
          _signinErrorMessage = "Email not verified !";
        });
        return;
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    } on FirebaseAuthException {
      setState(() {
        _signinErrorMessage = "Email or password is incorrect !";
      });
    } catch (e) {
      // Catch any null errors or unexpected errors
      print("Unexpected error in login: $e");
    }
  }
}
