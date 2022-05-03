// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gwallet_flutter_app/util/my_button.dart';
import 'package:gwallet_flutter_app/util/my_card.dart';
import 'package:gwallet_flutter_app/util/my_list-tile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.blue),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.monetization_on, color: Colors.blue))
        ]),
      ),
      body: SafeArea(
        child: Column(children: [
          // app bar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gwallet',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 4.0),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.blue,
                    )),
              ],
            ),
          ),
          SizedBox(height: 10),

          Container(
            height: 198,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: [
                MyCard(
                  balance: 8950.20,
                  cardNumber: 123456789,
                  expiryMonth: 10,
                  expiryYear: 24,
                  color: Colors.blue,
                ),
                MyCard(
                  balance: 5340.20,
                  cardNumber: 123456789,
                  expiryMonth: 12,
                  expiryYear: 23,
                  color: Colors.red,
                ),
                MyCard(
                  balance: 3330.20,
                  cardNumber: 123456789,
                  expiryMonth: 12,
                  expiryYear: 25,
                  color: Colors.green[400],
                ),
              ],
            ),
          ),
          SizedBox(height: 24),

          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.grey.shade600,
            ),
          ),

          SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  iconImagePath: 'lib/icons/credit-card.png',
                  buttonText: 'Pay',
                ),
                MyButton(
                  iconImagePath: 'lib/icons/save-money.png',
                  buttonText: 'Send',
                ),
                MyButton(
                  iconImagePath: 'lib/icons/bill.png',
                  buttonText: 'Bills',
                ),
              ],
            ),
          ),
          SizedBox(height: 0),

          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(children: [
              MyListTile(
                iconImagePath: 'lib/icons/transactions.png',
                tileTitle: 'History',
                tileSubtitle: 'Transactions Made',
              ),
              MyListTile(
                iconImagePath: 'lib/icons/graph-file.png',
                tileTitle: 'Payments',
                tileSubtitle: 'Statistics on Payment',
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
