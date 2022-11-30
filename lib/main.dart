import 'package:cryptoapp/BuyAsset.dart';
import 'package:cryptoapp/FailPage.dart';
import 'package:cryptoapp/MarketPage.dart';
import 'package:cryptoapp/PaymentSelectionScreen.dart';

import 'package:cryptoapp/Profile.dart';
import 'package:cryptoapp/SplashScreen.dart';
import 'package:cryptoapp/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/SuccessPage.dart';

import 'HomeScreen.dart';
import 'Login.dart';

// Screens:
// Splash
// Login => Login()
// Signup => signup()
// home => HomeScreen()
// market => MarketPage()
// buy => BuyAsset()
// payment selection
// success
// fail
// profile

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'DynaPuff'),
      initialRoute: '/splash',
      routes: {
        '/': (context) => HomeScreen(),
        '/splash': (context) => SplashScreen(),
        '/login': (context) => Login(),
        '/signup': (context) => signup(),
        '/buy': (context) => BuyAsset(),
        '/payment_selection': (context) => PaymentSelectionScreen(),
        '/market': (context) => MarketPage(),
        '/success': (context) => SuccessPage(),
        '/fail': (context) => FailPage(),
        '/profile': (context) => Profile(),
      },
    ),
  );
}
