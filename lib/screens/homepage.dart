import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import
import 'package:intl/intl.dart';
import 'package:ramees/controller/income_controller.dart';
import 'package:ramees/screens/addexpensepage.dart';
import 'package:ramees/util/constants.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

String formatDate(DateTime date) {
  return DateFormat('dd-MMMM-yyyy hh:mm a').format(date);
}

class _HomeContentState extends State<HomeContent> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Exit'),
        content: Text('Do you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: TextStyle(color: kThirdcolor),
            ),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(),
            child: Text(
              'OK',style: TextStyle(color: kThirdcolor),
            ),
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final sendAgainImages = [
      'asset/images/girl.png',
      'asset/images/av1.png',
      'asset/images/av2.png',
      'asset/images/av3.png',
      'asset/images/av4.png',
    ];

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
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
                    top: 90,
                    left: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good afternoon',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Enjelin Morgeana',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(width: 150),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(7)),
                          child: Icon(
                            Icons.notifications_active_outlined,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 210,
                    left: 50,
                    width: 310,
                    height: 180,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Color(0xff2F7E79),
                          borderRadius: BorderRadius.circular(10),
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                                height: 10,
                              ),
                              Text(
                                "Total Balance",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 130,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${totalBalance }',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 25),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          child: Icon(
                                              Icons.arrow_downward_rounded,
                                              color: Colors.white)),
                                      SizedBox(width: 5),
                                      Text(
                                        'Income',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '  ${totalIncome }  ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          child: Icon(
                                              Icons.arrow_upward_rounded,
                                              color: Colors.white)),
                                      SizedBox(width: 5),
                                      Text(
                                        'Expenses',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '${totalExpense}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 380,
                        ),
                        Text(
                          'Transaction History',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        transactionlist.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'No transactions available',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: transactionlist.length,
                                itemBuilder: (context, index) {
                                  final transaction = transactionlist[index];

                                  bool isIncome =
                                      transaction['type'] == 'income';
                                  String amountPrefix = isIncome ? '+' : '-';
                                  Color amountColor =
                                      isIncome ? Colors.green : Colors.red;

                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.grey.shade200,
                                      child: Image.asset(
                                        transaction['image'] as String,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Text(transaction['name'] as String),
                                    subtitle:
                                        Text(formatDate(transaction['date'])),
                                    trailing: Text(
                                      '$amountPrefix${transaction['amount'].toString()}',
                                      style: TextStyle(
                                        color: amountColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                },
                              ),
                        SizedBox(height: 20),
                        Text(
                          'Send Again',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:
                              List.generate(sendAgainImages.length, (index) {
                            return CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey.shade200,
                              child: Image.asset(sendAgainImages[index],
                                  fit: BoxFit.fill),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
