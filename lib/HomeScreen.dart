import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(child: Text("Homescreen test"), onPressed:(){
        Navigator.pushNamed(context, '/market');
      } ,),
    );
  }
}
