import 'package:flutter/material.dart';
import 'package:ramees/controller/income_controller.dart';
import 'package:ramees/screens/bottomnavpage.dart';
import 'package:ramees/screens/homepage.dart';
import 'package:ramees/screens/walletpage.dart';
import 'package:ramees/util/constants.dart';

class AddIncomePage extends StatefulWidget {
  const AddIncomePage({Key? key}) : super(key: key);

  @override
  _AddIncomePageState createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  final List<String> dropdownItems = [
    'Upwork',
    'Paypal',
    'Shop',
  ];

  final Map<String, String> itemImages = {
    'Upwork': 'asset/images/up1.png',
    'Paypal': 'asset/images/sunil.png',
    'Shop': 'asset/images/disney.jpeg',
  };

  String dropdownValue = 'Upwork';
  DateTime selectedDate = DateTime.now();
  TextEditingController _amountController = TextEditingController();

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
        leading: IconButton(onPressed:(){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        title: Row(
          children: [
            Text(
              'Add Income',
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
                    Container(
                      height: 40,
                      child: TextField(
                        controller: _amountController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kThirdcolor),
                          ),
                          border: OutlineInputBorder(),
                          labelText: '\$ 0.00',
                          suffixIcon: TextButton(
                            onPressed: () {
                              _amountController.clear();
                            },
                            child: Text('Clear'),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(height: 20),
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
                          hintText: '${selectedDate.toLocal()}'.split(' ')[0],
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_amountController.text.isNotEmpty) {
                          double amount = double.parse(_amountController.text);

                          Map<String, dynamic> incomeMapdata = {
                            'name': dropdownValue,
                            'amount': amount,
                            'date': selectedDate,
                            'image': itemImages[dropdownValue],
                            'type': 'income'
                          };

                          addincome(income: incomeMapdata);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavPage(),
                              ));
                        }
                      },
                      child: Text(
                        'Add Income',
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
