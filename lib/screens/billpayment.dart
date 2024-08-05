import 'package:flutter/material.dart';
import 'package:ramees/util/constants.dart';
import 'package:ramees/widget/textrow.dart';

class BillpaymentPage extends StatelessWidget {
  const BillpaymentPage({super.key});

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
           Navigator.pop(context,true);
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
                    backgroundImage: AssetImage('asset/images/ok.png'),
                    radius: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                 Text('Payment Successful',  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: kThirdcolor),),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'YouTube premium', style: TextStyle(fontSize: 15,)
                  
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Trasaction Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          width: 130,
                        ),
                        Icon(Icons.keyboard_arrow_up),
                      ],
                    ),
                  ),
                  
                  
                  TextRow(first: 'payment Method ', second: 'Debit  Card'),
                  Row(
                    
                    children: [
                      Text('Status',style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Text('Completed',style: TextStyle(color: kThirdcolor,fontSize: 18,fontWeight: FontWeight.bold),
                      ),
                    ],
                 
                  ),
                  TextRow(first: 'Time', second: '10 Am'),
                  TextRow(first: 'Date', second: 'Feb 30,2022'),
                  TextRow(first: 'Transaction ID', second: '234897689567590'),
                  SizedBox(height: 10,),
                  Divider(

                  ),
                  SizedBox(height: 10,),
                  TextRow(first: 'Price', second: '\$11.99'),
                  TextRow(first: 'Fee', second: '-\$1.99'),
                  SizedBox(height: 10,),
                  Divider(),
                  Row(
                    
                    children: [
                      Text('Total',style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Text('\&13.98',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                      ),
                    ],
                 
                  ),
                  SizedBox(height: 40,),
                  Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: kThirdcolor),borderRadius: BorderRadius.circular(25)
                    ),
                    child: TextButton(onPressed: () {
                      
                      
                    }, child: Text('share Receipt',style: TextStyle(color: kThirdcolor,fontSize: 18),)),
                  )


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
