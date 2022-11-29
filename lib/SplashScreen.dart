import 'package:cryptoapp/MarketPage.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:cryptoapp/Login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(

      navigateRoute: Login(),
      duration: 3000,
      imageSize: 130,
      imageSrc: "assets/images/clogo.jpg",
      text: "Carbon",
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(
        fontSize: 30.0,
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
      backgroundColor: Color(0xFF0719C5),
    );
  }
}
