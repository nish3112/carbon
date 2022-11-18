import 'package:cryptoapp/Componenets.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home :SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 35, 0, 0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "in the past 24 hours",
                            style: TextStyle(color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Market is up",
                            style: TextStyle(color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text("+9.17%",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/market.jpg', height: 60, width: 60,),
                      ),
                    ],
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                  child: AnimSearchBar(
                    width: 400,
                    textController: textController,
                    onSuffixTap: () {
                      setState(() {
                        textController.clear();
                      });
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                  child: Text("Options go here"),
                ),
                SizedBox(height: 40),
                Container(
                  //TODO Change height here
                  height: 435,
                  child: ListView(
                    children: [
                      cryptoAssets(assetcode: 'BTC',assetname: 'Bitcoin', price: '\$29218.23', gain: '+\$1000(0.9%)',),
                      cryptoAssets(assetcode: 'BTC',assetname: 'Bitcoin', price: '\$29218.23', gain: '+\$1000(0.9%)',),
                      cryptoAssets(assetcode: 'BTC',assetname: 'Bitcoin', price: '\$29218.23', gain: '+\$1000(0.9%)',),
                      cryptoAssets(assetcode: 'BTC',assetname: 'Bitcoin', price: '\$29218.23', gain: '+\$1000(0.9%)',),
                      cryptoAssets(assetcode: 'BTC',assetname: 'Bitcoin', price: '\$29218.23', gain: '+\$1000(0.9%)',),
                      cryptoAssets(assetcode: 'BTC',assetname: 'Bitcoin', price: '\$29218.23', gain: '+\$1000(0.9%)',),
                      cryptoAssets(assetcode: 'BTC',assetname: 'Bitcoin', price: '\$29218.23', gain: '+\$1000(0.9%)',),
                      cryptoAssets(assetcode: 'BTC',assetname: 'Bitcoin', price: '\$29218.23', gain: '+\$1000(0.9%)',),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 10,
            selectedItemColor: Colors.blue,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart_rounded),
                label: 'portfolio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.compare_arrows_rounded),
                label: 'exchange',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.stacked_line_chart_rounded),
                label: 'market',

              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
