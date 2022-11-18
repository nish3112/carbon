import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

//TODO For payment page
class PaymentCard extends StatelessWidget {
  String paymentMethod = "";

  PaymentCard({required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: new EdgeInsets.fromLTRB(0, 15, 0, 15),
      // decoration: BoxDecoration(
      //     border: Border.all(color: Colors.blueAccent)
      // ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 5, 10, 5),
            child: Image.asset(
              'assets/images/visa.jpg',
              height: height / 25,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$paymentMethod",
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "**** 4689",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.normal,
                    fontSize: 14),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
            child: RoundCheckBox(
              onTap: (selected) {},
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}


//TODO For portfolio and marketplace page
class cryptoAssets extends StatelessWidget {
  cryptoAssets({required this.assetcode, required this.assetname, required this.price, required this.gain});
  var assetname = "";
  var assetcode = "";
  var price = "";
  var gain = "";

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.white,
        height: 70,
        width: width - 30,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/btc.jpg'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                    child: Text('$assetcode',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Text('$assetname',style: TextStyle(fontSize: 15, color: Colors.grey),),
                ],
              ),
            ),
            Image.asset('assets/images/temp_graph.jpg', width: 120,),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("$price",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Text("$gain", style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO Bottom nav bar

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
          ],
        ),
      );

  }
}
