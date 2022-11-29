import 'package:cryptoapp/PaymentSelectionScreen.dart';
import 'package:flutter/material.dart';
import 'package:cool_dropdown/cool_dropdown.dart';

class BuyAsset extends StatefulWidget {
  const BuyAsset({Key? key}) : super(key: key);

  @override
  State<BuyAsset> createState() => _BuyAssetState();
}

class _BuyAssetState extends State<BuyAsset> {
  List dropdownItemList = [
    {'label': 'BTC', 'value': 'BTC'}, // label is required and unique
    {'label': 'ETH', 'value': 'ETH'},
    {'label': 'XRP', 'value': 'XRP'},
    {'label': 'USDT', 'value': 'USDT'},
    {'label': 'USDC', 'value': 'USDC'},
    {'label': 'TRX', 'value': 'TRX'},
  ];

  TextEditingController rupee = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Buy Bitcoin',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 15, 10, 5),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/card.jpg',
                            height: 45,
                            width: 45,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Select payment method",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Credit, debit card, UPI",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: Icon(Icons.keyboard_arrow_right_rounded),
                          ),
                        ],
                      ),
                      onPressed:(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentSelectionScreen()));
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 45,
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    '\u{20B9} ',
                    style: TextStyle(fontSize: 40),
                  )),
                  Container(
                    width: 100,
                    child: TextField(
                      controller: rupee,
                      style: TextStyle(
                        fontSize: 40,
                      ),
                      // maxLength: 5,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            CoolDropdown(
              selectedItemTS: TextStyle(fontSize: 20, color: Colors.blueAccent),
              selectedItemBD: BoxDecoration(
                color: Colors.blue[100],
              ),
              dropdownList: dropdownItemList,
              onChange: (_) {},
              defaultValue: dropdownItemList[3],
            ),
            Spacer(),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Container(
                  width: 300,
                  height: 50,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xff0152FE)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                          ))),
                    onPressed: () {},
                    child: Text('Buy', style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
