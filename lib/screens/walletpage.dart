import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ramees/controller/income_controller.dart';
import 'package:ramees/screens/addincome.dart';
import 'package:ramees/screens/billdetailspage.dart';
import 'package:ramees/screens/connectwallet.dart';
import 'package:ramees/screens/homepage.dart';

import 'package:ramees/util/constants.dart';
import 'package:ramees/widget/actionwidget.dart';
import 'package:ramees/widget/transactionitemwidget.dart';
import 'package:ramees/widget/transactionwidget.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {


    String formatDateonly(DateTime date) {
  return DateFormat('dd-MMMM-yyyy ').format(date);
}


 String formattime(DateTime date) {
  return DateFormat(' hh:mm a').format(date);
}

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(onPressed: () {
            
          }, icon: Icon(Icons.arrow_back_ios,color:Colors.white ,)),
          title: Center(
            child: Text(
              'Wallet',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon:
                  Icon(Icons.notifications_none_outlined, color: Colors.white),
              onPressed: () {
              },
            ),
          ],
          centerTitle: true,
        ),
        body: Stack(
          children: [
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
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    Text('Total Balance'),
                    Text(
                      '\$2,548.00',
                      style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddIncomePage(),
                                ),
                              );
                            },
                            child: ActionButton(icon: Icons.add, label: 'Add')),
                        ActionButton(icon: Icons.qr_code, label: 'Pay'),
                        ActionButton(icon: Icons.send, label: 'Send'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 310,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TabBar(
                        dividerHeight: 0,
                        indicatorSize: TabBarIndicatorSize.tab,
                        padding: EdgeInsets.all(3),
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(text: 'Transactions'),
                          Tab(text: 'Upcoming Bills'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: transactionlist.length,
                            itemBuilder: (context, index) {
                              final transaction = transactionlist[index];

                              bool isIncome = transaction['type'] == 'income';
                              String amountPrefix = isIncome ? '+' : '-';
                              Color amountColor =
                                  isIncome ? Colors.green : Colors.red;

                                Color backgroundColor = isIncome ? Colors.green : Colors.red;

                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey.shade200,
                                  child: Image.asset(
                                    transaction['image'] as String,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(transaction['name'] as String),
                                subtitle: Text(formatDate(transaction['date'])),
                                trailing: GestureDetector(
                                  onTap: () {
                                    showBottomSheet(
                                      context: context,
                                      builder: (context) => Transaction(
                                        txt1: transaction['type'],
                                        txt2: 'From',
                                        txt3: transaction['name'],
                                        date: formatDateonly(transaction['date']),
                                        imagepath: transaction['image'],
                                        amount: transaction['amount'],
                                        txt5: transaction['type'],
                                        time:formattime( transaction['date']),
                                        color: amountColor =
                                  isIncome ? kThirdcolor : Colors.red,
                                        color2: backgroundColor = isIncome ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    '$amountPrefix${transaction['amount'].toString()}',
                                    style: TextStyle(
                                      color: amountColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              TransactionItem(
                                image: 'asset/images/frame.png',
                                title: 'Youtube',
                                date: 'Fed 28,2022',
                                amount: 'Pay',
                                amountColor: kBackgroundcolor,
                                onImageTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => BilldetailsPage()));
                                },
                                onAmountTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ConnectPage()));
                                },
                              ),
                              TransactionItem(
                                image: 'asset/images/Frame 9.png',
                                title: 'Electricity',
                                date: 'March 28,2022',
                                amount: 'Pay',
                                amountColor: kBackgroundcolor,
                                onAmountTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ConnectPage()));
                                },
                              ),
                              TransactionItem(
                                image: 'asset/images/Frame 9 (1).png',
                                title: 'House Rent',
                                date: 'March 31, 2022',
                                amount: 'Pay',
                                amountColor: kBackgroundcolor,
                                onAmountTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ConnectPage()));
                                },
                              ),
                              TransactionItem(
                                image: 'asset/images/spotify.png',
                                title: 'Spotify',
                                date: 'Feb 28, 2022',
                                amount: 'Pay',
                                amountColor: kBackgroundcolor,
                                onAmountTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ConnectPage()));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
