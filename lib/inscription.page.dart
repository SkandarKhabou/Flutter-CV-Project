import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvflutter/login.page.dart';
import 'package:cvflutter/welcome.page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final _formKey = GlobalKey<FormState>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String? _fullName;
  String? _username;
  String? _password;
  String? _usernameValidationMessage;
  bool _usernameExists = false;
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
                          backgroundImage:
                              AssetImage("assets/images/avatar.png"),
                          radius: 50,
                          backgroundColor: Colors.blue,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF9195FF),
                            disabledBorder: InputBorder.none,
                            labelText: 'Full name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your full name';
                            } else if (value.length <= 6) {
                              return 'Full name should be longer than 6 characters';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _fullName = value;
                          },
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
                            if (_usernameValidationMessage != null) {
                              return _usernameValidationMessage!;
                            }
                            if (_usernameExists) {
                              return 'Username already exists';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _username = value;
                            });
                            validateUsername(value);
                          },
                          onSaved: (value) {
                            setState(() {
                              _username = value;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF9195FF),
                            disabledBorder: InputBorder.none,
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            } else if (value.length <= 8) {
                              return 'Password should be longer than 8 characters';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value;
                          },
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: Text(
                            'I already have an account !',
                            style: TextStyle(color: Color(0xff41a8f5)),
                          ),
                        ),
                        SizedBox(
                          width: 170,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                addUser();
                              }
                            },
                            child: Text('Sign Up'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
                            ),
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
    );
  }

  Future<void> addUser() async {
    prefs = await SharedPreferences.getInstance();
    users
        .doc(_username!)
        .set({
          'fullname': _fullName,
          'username': _username,
          'password': _password,
        })
        .then((value) => print("User Added with ID: $_username"))
        .catchError((error) => print("Failed to add user: $error"));
    prefs.setBool("connecte", true);
    prefs.setString("username", _username!);
    prefs.setString("password", _password!);
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),
    );
  }

  Future<bool> findUsername(String username) async {
    try {
      QuerySnapshot querySnapshot = await users.get();

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        if (doc['username'].toLowerCase() == username.toLowerCase()) {
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

  void validateUsername(String? value) async {
    if (value == null || value.isEmpty) {
      setState(() {
        _usernameValidationMessage = 'Please enter a username';
      });
    } else {
      bool usernameExists = await findUsername(value);
      setState(() {
        _usernameExists = usernameExists;
      });
      if (usernameExists) {
        setState(() {
          _usernameValidationMessage = 'Username already exists';
        });
      } else {
        setState(() {
          _usernameValidationMessage = null;
        });
      }
    }
  }
}
