import 'package:flutter/material.dart';
import 'package:ramees/screens/billpayment.dart';
import 'package:ramees/util/constants.dart';
import 'package:ramees/widget/textrow.dart';

class BillPage2 extends StatelessWidget {
  const BillPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        title: Row(
          children: [
            Text(
              'Bill Payment',
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
            icon: Icon(Icons.more_horiz, color: Colors.white),
            onPressed: () {
              // Handle notifications button action
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
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('asset/images/utube.png'),
                    radius: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      Text(
                        'You will pay',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Youtube Premium',
                        style: TextStyle(
                            color: kThirdcolor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '      for one month with BCA oneklick',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextRow(first: 'Price', second: '\$11.9'),
                  TextRow(first: 'Fee', second: '\$1.99'),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  TextRow(first: 'Total', second: '\$13.98'),
                  SizedBox(
                    height: 200,
                  ),
                  Container(
                    height: 60,
                    width: 320,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [kgrad1, kgrad2],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 9),
                              color: kBackgroundcolor.withOpacity(0.3)),
                        ]),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => BillpaymentPage()),
                        );
                      },
                      child: Text(
                        'Confirm and Pay',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
