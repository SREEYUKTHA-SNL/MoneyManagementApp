import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();

  String result = '0';
  String errorText1 = '';
  String errorText2 = '';

  void add() {
    int sum = int.parse(num1.text) + int.parse(num2.text);

    result = sum.toString();
    setState(() {});
  }

  void diff() {
    int diff = int.parse(num1.text) - int.parse(num2.text);

    result = diff.toString();
    setState(() {});
  }

  void mul() {
    int mul = int.parse(num1.text) * int.parse(num2.text);

    result = mul.toString();
    setState(() {});
  }

  void div() {
    int div = int.parse(num1.text) % int.parse(num2.text);

    result = div.toString();
    setState(() {});
  }

  void validate() {
    if (num1.text.isEmpty && num2.text.isEmpty) {
      errorText1 = 'invalid';
      errorText2 = 'invalid';
    } else if (num1.text.isEmpty) {
      errorText1 = 'invalid';
    } else if (num2.text.isEmpty) {
      errorText2 = 'invalid';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Simplistic calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                result,
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Divider(
              thickness: 4,
              indent: 20,
              endIndent: 20,
              color: Colors.black54,
            ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: num1,
                    decoration: InputDecoration(
                        label: Text(
                          'enter number ',
                        ),
                        errorText: errorText1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: num2,
                decoration: InputDecoration(
                    label: Text('enter number '), errorText: errorText2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 90,
                  ),
                  GestureDetector(
                    onTap: () {
                      add();
                      validate();
                    },
                    child: Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue),
                      child: Center(
                          child: Text(
                        '+',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      validate();
                      diff();
                    },
                    child: Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue),
                      child: Center(
                          child:
                              Text('-', style: TextStyle(color: Colors.white))),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      mul();
                      validate();
                    },
                    child: Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue),
                      child: Center(
                          child:
                              Text('*', style: TextStyle(color: Colors.white))),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      div();
                      validate();
                    },
                    child: Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue),
                      child: Center(
                          child:
                              Text('/', style: TextStyle(color: Colors.white))),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
