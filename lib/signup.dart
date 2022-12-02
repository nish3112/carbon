import 'package:cryptoapp/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart' show timeDilation;

import 'HomeScreen.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: true,
          title: const Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Builder(
          builder: (context)=>SafeArea(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text("It only takes a minute to create your account",
                      style: TextStyle(color: Colors.grey[800], fontSize: 15)),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              focusColor: Colors.black,
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: 'First Name',
                              hintStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              focusColor: Colors.black,
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: 'Last Name',
                              hintStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          controller: email,
                          decoration: InputDecoration(
                              focusColor: Colors.black,
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: 'Email Address',
                              hintStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                              focusColor: Colors.black,
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                            "I agree to carbon's terms of services and Privacy Policy"),
                        value: timeDilation != 1.0,
                        onChanged: (bool? value) {
                          setState(() {
                            timeDilation = value! ? 2.0 : 1.0;
                          });
                        }),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 50,
                      child: ElevatedButton(
                        onPressed: () {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: email.text, password: password.text)
                              .then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                          }).onError((error, stackTrace) {
                            final snackBar = SnackBar(
                              content: const Text('Error signing up! Please try again'),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {},
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            });
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 20.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            primary: Color(0xFF0814c4)
                        ),
                        child: Text(
                          "Create Account",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),

                    TextButton(
                      child: Text('Already registered? Sign In',style: TextStyle(color : Color(0xFF0814c4)),),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
