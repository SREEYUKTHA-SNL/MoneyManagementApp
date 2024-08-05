import 'package:flutter/material.dart';
import 'package:ramees/screens/billpayment2.dart';
import 'package:ramees/util/constants.dart';
import 'package:ramees/widget/textrow.dart';

class BilldetailsPage extends StatefulWidget {
  const BilldetailsPage({super.key});

  @override
  _BilldetailsPageState createState() => _BilldetailsPageState();
}

class _BilldetailsPageState extends State<BilldetailsPage> {
  String? _selectedPaymentMethod;

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
            Navigator.pop(context); // Handle back button action
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
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('asset/images/utube.png'),
                            radius: 40,
                          ),
                          SizedBox(width: 10), // Added a SizedBox for spacing
                          Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align text to the left
                            children: [
                              Text('Youtube Premium',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                  height: 6), // Added a SizedBox for spacing
                              Text('Feb 28,2022',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black.withOpacity(0.4))),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      TextRow(first: 'Price', second: '\$11.9'),
                      TextRow(first: 'Fee', second: '\$1.99'),
                      Divider(),
                      SizedBox(height: 10),
                      TextRow(first: 'Total', second: '\$13.98'),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Select payment method',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        height: 100,
                        width: double
                            .infinity, // Set width to full width of parent
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 46, 137, 107)
                              .withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio<String>(
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return kThirdcolor.withOpacity(.32);
                                }
                                return kThirdcolor;
                              }),
                              value: 'Debit Card',
                              groupValue: _selectedPaymentMethod,
                              onChanged: (value) {
                                setState(() {
                                  _selectedPaymentMethod = value;
                                });
                              },
                            ),
                            Image.asset('asset/images/credit-card-fill 1.png'),
                            SizedBox(width: 10),
                            Text(
                              'Debit Card',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: kThirdcolor),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 175, 180, 179)
                              .withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio<String>(
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return kThirdcolor.withOpacity(.32);
                                }
                                return kThirdcolor;
                              }),
                              value: 'Paypal',
                              groupValue: _selectedPaymentMethod,
                              onChanged: (value) {
                                setState(() {
                                  _selectedPaymentMethod = value;
                                });
                              },
                            ),
                            Image.asset('asset/images/logo-paypal 1.png',
                                width: 50, height: 50),
                            SizedBox(width: 10),
                            Text(
                              'Paypal',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
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
                              color: kBackgroundcolor.withOpacity(0.3),
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BillPage2()));
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
            ),
          ),
        ],
      ),
    );
  }
}
