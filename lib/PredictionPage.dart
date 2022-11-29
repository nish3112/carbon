import 'package:flutter/material.dart';
import 'package:cool_dropdown/cool_dropdown.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({Key? key}) : super(key: key);

  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  List dropdownItemList = [
    {'label': 'Bitcoin', 'value': 'BTC'}, // label is required and unique
    {'label': 'Ethereum', 'value': 'ETH'},
    {'label': 'Ripple', 'value': 'XRP'},
    {'label': 'Binance Coin', 'value': 'BNB'},
    {'label': 'Tron', 'value': 'TRX'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "Prediction Page",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              const Center(
                child: Text(
                  "Select the cryptocurrency you want prediction for",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CoolDropdown(
                  dropdownList: dropdownItemList,
                  onChange: (_) {},
                  defaultValue: dropdownItemList[3],
                  // placeholder: 'insert...',
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text("Predict"),
                ),
              SizedBox(height: MediaQuery.of(context).size.height/20,)
            ],
          ),
        ),
      ),
    );
  }
}
