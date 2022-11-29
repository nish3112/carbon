import 'package:flutter/material.dart';

import 'MarketPage.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

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
                    "Congratulations!!!",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Your order was ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "succesfully placed",
                    style: TextStyle(fontSize: 20),
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
