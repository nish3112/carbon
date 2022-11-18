import 'package:cryptoapp/Componenets.dart';
import "package:flutter/material.dart";

class PaymentSelectionScreen extends StatefulWidget {
  const PaymentSelectionScreen({Key? key}) : super(key: key);

  @override
  State<PaymentSelectionScreen> createState() => _PaymentSelectionScreenState();
}

class _PaymentSelectionScreenState extends State<PaymentSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: true,
          leading: TextButton(child: Icon(Icons.arrow_back, color: Colors.black,), onPressed: (){

          },),
          title:const Text("Select Payment", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 5,),
                Center(
                  child: Text("Select your preferred payment methods", style: TextStyle(color: Colors.grey[800],fontSize: 15)
                  ),
                ),
                SizedBox(height: 50,),
                Column(
                  children: [
                    PaymentCard(paymentMethod: "Visa MasterCard"),
                    PaymentCard(paymentMethod: "Apple Pay"),
                    PaymentCard(paymentMethod: "UPI")
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 15, 10, 5),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/add.jpg',height: 45,width: 45,),
                            SizedBox(width: 20,),
                            Text(
                              "Add payment method",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
