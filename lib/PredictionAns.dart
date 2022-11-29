import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


class PredictionAns extends StatelessWidget {
  const PredictionAns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.greenAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                const Text("The predicted price for BTC is : ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                const Padding(
                  padding: const EdgeInsets.fromLTRB(0,20,0,0),
                  child: Text("\$40000",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25
                  ),),
                ),
                Spacer(),
                TextButton(onPressed: (){}, child: Text("ok"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
