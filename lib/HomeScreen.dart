import 'dart:async';
import 'dart:convert';

import 'package:cryptoapp/Componenets.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import "package:flutter/material.dart";

import 'BuyAsset.dart';
import 'package:http/http.dart' as http;
import 'MarketPage.dart';
import 'Profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
  final pages = [
    HomeScreen(),
    BuyAsset(),
    MarketPage(),
    Profile()
  ];
  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&sparkline=false'));
    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }
  @override
  void initState() {
    fetchCoin();
    Timer.periodic(Duration(seconds: 10), (timer) => fetchCoin());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(20, 6, 0, 2),
            child: Image.asset('assets/images/clogo.jpg'),
          ),
          actions: [IconButton(
            icon: Icon(Icons.notifications),
            tooltip: "Info",
            onPressed: () {

            },
          )],
          actionsIconTheme: IconThemeData(
              size: 30.0,
              color: Colors.black,
              opacity: 10.0
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: true,
          title:const Text("Cryptoland", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),

                    height: MediaQuery.of(context).size.height/3.6,
                    width: MediaQuery.of(context).size.width-20,
                    child: Stack(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                                  child: Text("My Balance", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                                ),
                              ),
                              Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                                      child: Text("\$32,761.65", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                                          child: Text("\$1896  Today's Profit", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                            child: Align(
                                alignment: Alignment.bottomCenter,
                              child : Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                height: MediaQuery.of(context).size.height/10,
                                width: MediaQuery.of(context).size.width-100,
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    new IconButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => MarketPage()));
                                      },
                                      icon: Image.asset("assets/images/bar-chart.png"),
                                    ),
                                    new IconButton(
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => BuyAsset()));
                                      },
                                      icon: Image.asset("assets/images/right-arrow.png"),
                                    ),
                                    new IconButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                                      },
                                      icon: Image.asset("assets/images/refresh.png"),
                                    ),
                                  ],
                                ),

                              ),
                            ),
                        )
                      ]
                    )
                  ),
                 Padding(
                   padding: EdgeInsets.fromLTRB(20,10, 0, 10),
                   child: Container(
                     alignment: Alignment.centerLeft,
                     child: Text("Top performers",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30), ),
                   ),
                 ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      height: MediaQuery.of(context).size.height/2.4,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: coinList.length,
                      itemBuilder: (context, index) {
                        return CoinCard(
                          name: coinList[index].name,
                          symbol: coinList[index].symbol,
                          imageUrl: coinList[index].imageUrl,
                          price: coinList[index].price.toDouble(),
                          change: coinList[index].change.toDouble(),
                          changePercentage:
                          coinList[index].changePercentage.toDouble(),
                        );
                      },
                    ),
                    ),
                  ),
                 Spacer(),
                ],
              ),
            ),
          ),

        ),
        bottomNavigationBar: CustomNavigationBar(

          backgroundColor: Colors.white60,
          items: [
            CustomNavigationBarItem(
              icon: Image.asset('assets/images/home_final.png'),
              title: Text(""),
            ),
            CustomNavigationBarItem(
              icon: Image.asset('assets/images/exchange_final.png'),
              title: Text(""),
            ),
            CustomNavigationBarItem(
              icon: Image.asset('assets/images/market_final.png'),
              title: Text(""),
            ),
            CustomNavigationBarItem(
              icon: Image.asset('assets/images/profile_final.png'),
              title: Text(""),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              Navigator.push(context, MaterialPageRoute(builder: (context) => pages[index]));

            });
          },
        ),
      ),
    );
  }
}