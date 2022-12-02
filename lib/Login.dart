import 'package:cryptoapp/HomeScreen.dart';
import 'package:cryptoapp/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = new TextEditingController();

  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height =  MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(
        builder: (context)=>SafeArea(
          child: Container(

            height: MediaQuery.of(context).size.height,
            width:  MediaQuery.of(context).size.width,

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text(
                    "Log In",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
                  ),
                ),
                // Spacer(),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Image.asset(
                    'assets/images/clogo.jpg',
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width/2,
                  ),
                ),
                // Spacer(),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    width: MediaQuery.of(context).size.width-50,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                      controller: email,
                      decoration: InputDecoration(
                        focusColor: Colors.black,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: 'Email Address',
                          hintStyle: TextStyle(
                              color: Colors.black
                          )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    width: MediaQuery.of(context).size.width-50,
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                          focusColor: Colors.black,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.black
                        )
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width-50,
                  child: ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text).then((value){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                        }).onError((error, stackTrace) {
                          final snackBar = SnackBar(
                            content: const Text('Error logging in! Please try again'),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {},
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        primary: Color(0xFF0814c4),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> signup()));
                  }, child: Text("Don't have an account? Create one", style: TextStyle(color: Color(0xFF0814c4)),)),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
