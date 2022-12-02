import 'package:flutter/material.dart';

import 'MarketPage.dart';

class SuccessPage extends StatelessWidget {
  int rupee = 0;
  SuccessPage({required this.rupee});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Center(
                child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MarketPage()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/green_tick.gif',
                    gaplessPlayback: false,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Your payment was successful",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  Text(
                    "Your order for \u{20B9} $rupee was ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,color: Colors.grey[900]),
                  ),
                  Text(
                    "succesfully executed",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,color: Colors.grey[900])
                  ),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
