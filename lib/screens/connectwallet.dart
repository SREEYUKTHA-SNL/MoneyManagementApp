import 'package:flutter/material.dart';
import 'package:ramees/util/constants.dart';

class ConnectPage extends StatelessWidget {
  const ConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Text(
                'Connect Wallet',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon:
                  Icon(Icons.notifications_none_outlined, color: Colors.white),
              onPressed: () {},
            ),
          ],
          centerTitle: true,
        ),
        body: Stack(children: [
          Column(
            children: [
              Image.asset(
                'asset/images/download 4.png',
                fit: BoxFit.cover,
              ),
            ],
          ),
          Positioned(
            top: 190,
            left: 0,
            width: 390,
            height: 640,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 217, 212, 212),
                    offset: const Offset(3.0, 8.0),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                SizedBox(height: 20),
                Container(
                  width: 310,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerHeight: 0,
                    padding: EdgeInsets.all(3),
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: 'Cards'),
                      Tab(text: 'Accounts'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            'asset/images/Cards.png',
                            height: 200,
                            width: 500,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Add your debit Card',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'This card must be connected to a bank account under your name',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(height: 20),
                          Container(
                            margin: EdgeInsets.all(15),
                            child: TextField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kThirdcolor),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: 'NAME ON CARD',
                                labelStyle: TextStyle(color: Colors.black),
                                hintText: 'IRVAN MOSES',
                                hintStyle: TextStyle(color: kThirdcolor),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      labelText: 'DEBIT CARD NUMBER',
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      labelText: 'CVC',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      labelText: 'EXPIRATION MM/YY',
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'ZIP',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: [
                          Container(
                            height: 100,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 46, 137, 107)
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15)),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Image.asset('asset/images/Group 23 (1).png',
                                    width: 50, height: 50),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Bank Link',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: kThirdcolor),
                                    ),
                                    Text(
                                      'Connect your bank \n account to deposit & fund',
                                      style: TextStyle(color: kThirdcolor),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset('asset/images/Vector.png'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 320,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 175, 180, 179)
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15)),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Image.asset('asset/images/Group 23 (2).png',
                                    width: 50, height: 50),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Text(
                                      'Micro Deposits',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      '  Connect bank in 5-7 days',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 320,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 175, 180, 179)
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15)),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Image.asset('asset/images/logo-paypal 1.png',
                                    width: 50, height: 50),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Text(
                                      'PayPal',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      '  Connect You paypal Acoount',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kBackgroundcolor,
                                  ),
                                  borderRadius: BorderRadius.circular(25)),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        color: kThirdcolor, fontSize: 20),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
