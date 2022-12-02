import 'package:cryptoapp/Componenets.dart';
import 'package:cryptoapp/Login.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'BuyAsset.dart';
import 'HomeScreen.dart';
import 'MarketPage.dart';

class Profile extends StatefulWidget {
 Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 0;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  _signOut() async {
    await _firebaseAuth.signOut();
  }
  final pages = [
    HomeScreen(),
    BuyAsset(),
    MarketPage(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Builder(
        builder: (context)=>SafeArea(
            child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Center(
                  child: Text(
                    "Profile",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/profile_final.png',
                    )),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: MediaQuery.of(context).size.width-50,
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    enabled: false,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: 'Nishith Thakker',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          fontSize: 18
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: MediaQuery.of(context).size.width-50,
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    enabled: false,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: 'nishith.thakker@somaiya.edu',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: MediaQuery.of(context).size.width-50,
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    enabled: false,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: '+91 7021459609',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        )
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(

                height: MediaQuery.of(context).size.height/20,
                width: MediaQuery.of(context).size.width-50,
                decoration:new BoxDecoration(
                  color: Color(0xFF0814c4),
                    borderRadius: BorderRadius.circular(15.0),
                    ),
                child: ElevatedButton(
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: const Text('Request received. Our agent will contact you shortly'),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    style:ElevatedButton.styleFrom(
                        primary: Colors.white12,
                        elevation: 0
                    ),
                    child: Text("Request Change",style: TextStyle(color: Colors.white, fontSize: 18),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(

                height: MediaQuery.of(context).size.height/20,
                width: MediaQuery.of(context).size.width-50,
                decoration:new BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xFF0814c4),
                ),
                child: ElevatedButton(
                    onPressed: () {
                     _signOut();
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                    },
                    style:ElevatedButton.styleFrom(
                        primary: Colors.white12,
                        elevation: 0
                    ),
                    child: Text("Logout",style: TextStyle(color: Colors.white, fontSize: 18),)),
              ),
            ),
              Spacer(),


            ],
          ),
        ),),),
        bottomNavigationBar: CustomNavigationBar(

          backgroundColor: Colors.white60,
          items: [
            CustomNavigationBarItem(
              icon: Image.asset('assets/images/home_final.png'),
              title: Text(""),
            ),
            CustomNavigationBarItem(
              icon: Image.asset('assets/images/exchange_final.png'),
              title: Text(""),
            ),
            CustomNavigationBarItem(
              icon: Image.asset('assets/images/market_final.png'),
              title: Text(""),
            ),
            CustomNavigationBarItem(
              icon: Image.asset('assets/images/profile_final.png'),
              title: Text(""),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              Navigator.push(context, MaterialPageRoute(builder: (context) => pages[index]));

            });
          },
        ),
      ),
    );
  }
}


