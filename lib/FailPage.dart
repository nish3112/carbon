import 'package:flutter/material.dart';

class FailPage extends StatelessWidget {
  const FailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/cross.jpg',),
                  SizedBox(height: 25,),
                  Text("OOPS...",style: TextStyle(fontSize: 20),),
                  Text("Something went wrong",style: TextStyle(fontSize: 20),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
