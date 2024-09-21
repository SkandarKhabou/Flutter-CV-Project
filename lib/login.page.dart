import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvflutter/inscription.page.dart';
import 'package:cvflutter/welcome.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String? _username;
  String? _password;
  String _signinErrorMessage = "";
  bool _obscurePassword = true;
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  colors: [Colors.white, Color.fromARGB(255, 183, 218, 234)])),
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
                          backgroundImage: AssetImage("assets/images/kid.png"),
                          radius: 50,
                          backgroundColor: Colors.blue,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF9195FF),
                            disabledBorder: InputBorder.none,
                            labelText: 'Username',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _username = value;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF9195FF),
                            disabledBorder: InputBorder.none,
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Icon(
                                  _obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          obscureText: _obscurePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value;
                          },
                        ),
                        SizedBox(height: 20),
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
                            Text(
                              'Remember me',
                              style: TextStyle(color: Color(0xff41a8f5)),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InscriptionPage()),
                                );
                              },
                              child: Text(
                                'Don\'t have an account ?',
                                style: TextStyle(color: Color(0xff41a8f5)),
                              ),
                            )
                          ],
                        ),
                        Text(
                          _signinErrorMessage,
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 170,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                signIn();
                              }
                            },
                            child: Text('Sign In'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: signInWithGoogle,
                          child: Text('Sign In with Google'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {},
                          child: Text('Forgot password?'),
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

  Future<void> signIn() async {
    prefs = await SharedPreferences.getInstance();
    if ((await findUsernameAndPassword(_username!, _password!))) {
      if (_rememberMe) {
        prefs.setBool("connecte", true);
        prefs.setString("username", _username!);
        prefs.setString("password", _password!);
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    } else {
      setState(() {
        _signinErrorMessage = "Username or Password is wrong !";
      });
    }
  }

  Future<bool> findUsernameAndPassword(String username, String password) async {
    try {
      QuerySnapshot querySnapshot = await users.get();

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        if ((doc['username'].toLowerCase() == username.toLowerCase()) &&
            (doc['password'] == password)) {
          print('Username ${doc['username']} found in document ${doc.id}');
          return true;
        }
      }
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<void> signInWithGoogle() async {
    prefs = await SharedPreferences.getInstance();
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Here, you can access the user's name and last name
      var user = userCredential.user;
      print(
          "Name: ${user?.displayName}, Last Name: Extracted from displayName");
      if (_rememberMe) {
        prefs.setBool("connecte", true);
        prefs.setString("username", "googleConnected");
        prefs.setString("password", "googleConnected");
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth exception->${e.message}');
    } catch (e) {
      print('exception->$e');
    }
  }
}
