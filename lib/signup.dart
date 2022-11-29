import 'package:cryptoapp/Login.dart';
import 'package:cryptoapp/MarketPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/Componenets.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

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
          title:const Text("Sign Up", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 5,),
                Center(
                  child: Text("It only takes a minute to create your account", style: TextStyle(color: Colors.grey[800],fontSize: 15)
                  ),
                ),
                SizedBox(height: 50,),

                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        hintText: 'First Name',
                        labelText: 'First Name',

                        contentPadding: EdgeInsets.all(20.0),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        hintText: 'Last Name',
                        labelText: 'Last Name',
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                    ),SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        hintText: 'Email Id',
                        labelText: 'Email Id',
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                      suffixIcon: Icon(Icons.remove_red_eye),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        hintText: 'Password',
                        labelText: 'Password',
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    CheckboxListTile(

                      title: const Text('I agree to the cryptoland terms of services and Privacy Policy'),
                      value: timeDilation != 1.0,
                      onChanged: (bool? value) {
                        setState(() {
                          timeDilation = value! ? 5.0 : 1.0;
                        });
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text).then((value){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> MarketPage()));
                        }).onError((error, stackTrace) {
                          print("Error");
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          primary: Colors.blue
                      ),
                      child: Text(
                        "Create Account",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('OR' ),

                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          primary: Colors.white
                      ),
                      child: Text(
                        "Sign Up with Google",
                        style: TextStyle(color: Colors.black, fontSize: 14 ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextButton(child: Text('Alredy registered ? Sign In' ), onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                    },),
                  ]
                  ,
                ),
              ],
              
            ),
          ),
        ),

      ),
    );
  }
}
