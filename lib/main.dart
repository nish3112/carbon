import 'package:cryptoapp/BuyAsset.dart';
import 'package:cryptoapp/FailPage.dart';
import 'package:cryptoapp/MarketPage.dart';
import 'package:cryptoapp/PaymentSelectionScreen.dart';
import 'package:cryptoapp/PredictionAns.dart';
import 'package:cryptoapp/PredictionPage.dart';
import 'package:cryptoapp/SplashScreen.dart';
import 'package:cryptoapp/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/SuccessPage.dart';

import 'Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: (SplashScreen()),
  ));
}



