import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:ramees/controller/income_controller.dart';
import 'package:ramees/screens/bottomnavpage.dart';
import 'package:ramees/screens/homepage.dart';
import 'package:ramees/util/constants.dart';
import 'package:intl/intl.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage(
      {Key? key,
      required Null Function(dynamic title, dynamic amount, dynamic image)
          onAddExpense})
      : super(key: key);

  @override
  _AddExpensePageState createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final List<String> dropdownItems = [
    'Netflix',
    'Amazon Prime',
    'Disney+',
  ];

  final Map<String, String> itemImages = {
    'Netflix': 'asset/images/net.jpg',
    'Amazon Prime': 'asset/images/amazon.jpeg',
    'Disney+': 'asset/images/disney.jpeg',
  };

  String dropdownValue = 'Netflix';
  DateTime selectedDate = DateTime.now();

  TextEditingController _amountController = TextEditingController();
  String? validationMessage;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
        title: Row(
          children: [
            Text(
              'Add Expense',
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
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                'asset/images/download 4.png',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'asset/images/bg1.png',
                fit: BoxFit.cover,
                color: Colors.white,
              )
            ],
          ),
          Positioned(
            top: 190,
            left: 40,
            width: 310,
            height: 450,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 217, 212, 212),
                    offset: const Offset(3.0, 3.0),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NAME',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 40,
                      child: DropdownButtonFormField<String>(
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kThirdcolor),
                          ),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 16,
                              backgroundImage: AssetImage(
                                itemImages[dropdownValue]!,
                              ),
                            ),
                          ),
                        ),
                        items: dropdownItems
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'AMOUNT',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Container(
                          height: validationMessage == null ? 40 : null,
                          child: TextField(
                            controller: _amountController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kThirdcolor),
                              ),
                              border: OutlineInputBorder(),
                              hintText: 'Enter your amount',
                              hintStyle: TextStyle(fontWeight: FontWeight.normal),
                              errorText: validationMessage,
                              suffixIcon: TextButton(
                                onPressed: () {
                                  _amountController.clear();
                                },
                                child: Text('Clear',style: TextStyle(color: kThirdcolor),),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        if (validationMessage != null)
                          SizedBox(height: 20),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'DATE',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 40,
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kThirdcolor),
                          ),
                          border: OutlineInputBorder(),
                          labelText: '${selectedDate.toLocal()}'.split(' ')[0],
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () {
                              _selectDate(context);
                            },
                          ),
                        ),
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    DottedBorder(
                      radius: Radius.circular(3),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle),
                          SizedBox(width: 10),
                          Text(
                            'Add Invoice',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_amountController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please enter an amount.'),
                              ),
                            );
                          } else {
                            double amount = double.parse(_amountController.text);
                            if (totalBalance < amount) {
                              validationMessage =
                                  'Expense amount exceeds total balance' ;
                            } else {
                              Map<String, dynamic> expensemapdata = {
                                'name': dropdownValue,
                                'amount': amount,
                                'date': selectedDate,
                                'image': itemImages[dropdownValue],
                                'type': 'expense'
                              };

                              addexpense(expense: expensemapdata);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BottomNavPage(),
                                  ));
                            }
                          }
                        });
                      },
                      child: Text(
                        'Add Expense',
                        style: TextStyle(color: kThirdcolor),
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
