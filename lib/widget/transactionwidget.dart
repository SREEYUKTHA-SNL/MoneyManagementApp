import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart'; // Import open_file plugin

class Transaction extends StatelessWidget {
  const Transaction({
    Key? key,
    required this.txt1,
    required this.txt2,
    required this.txt3,
    required this.date,
    required this.imagepath,
    required this.txt5,
    required this.color,
    required this.color2,
    required this.amount,
    required this.time,
  }) : super(key: key);

  final String txt1;
  final String txt2;
  final String txt3;
  final String date;
  final String imagepath;
  final String txt5;
  final Color color;
  final Color color2;
  final double amount;
  final String time;

  Future<void> _generateAndSavePDF(BuildContext context) async {
    final pdf = pw.Document();

    
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Transaction Details',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 20,
                  ),
                  ),
              pw.SizedBox(height: 10),
              pw.Text('Status: $txt1',
                  style: pw.TextStyle(
                    fontSize: 18,
                  )),
              pw.Text('Additional Information: $txt2',
                  style: pw.TextStyle(fontSize: 18)),
              pw.Text('Details: $txt3',
                  style: pw.TextStyle(fontSize: 18)),
              pw.Text('Time: $time',
                  style: pw.TextStyle(fontSize: 18)),
              pw.Text('Date: $date',
                  style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 20),
              pw.Text('Amount: ₹ $amount',
                  style: pw.TextStyle(
                    fontSize: 25,
                    fontWeight: pw.FontWeight.bold,
                  )),
            ],
          );
        },
      ),
    );

    // Save the PDF document
    final output = await getExternalStorageDirectory();
    final file = File('${output!.path}/transaction_details.pdf');
    await file.writeAsBytes(await pdf.save());


    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
            top: 50,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              title: Row(
                children: [
                  Text(
                    'Transaction Details',
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
                  onPressed: () {},
                ),
              ],
              centerTitle: true,
            ),
          ),
          Positioned(
            top: 190,
            left: 0,
            right: 0,
            bottom: 0,
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
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(imagepath),
                      radius: 40,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: color2,
                      ),
                      child: Center(
                        child: Text(
                          txt5,
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '₹ $amount',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
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
                              'Transaction Details ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 130,
                          ),
                          Icon(Icons.keyboard_arrow_up),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Status',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          txt1,
                          style: TextStyle(
                            color: color,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          txt2,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          txt3,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Time ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Date',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextButton(
                        onPressed: () => _generateAndSavePDF(context),
                        child: Text(
                          'Download Receipt',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
