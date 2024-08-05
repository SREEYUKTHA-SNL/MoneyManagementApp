import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ramees/util/constants.dart';
import 'package:ramees/widget/chartwidget.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  final List<Map<String, dynamic>> transactions = [
    {
      'image': 'asset/images/Frame 9 (2).png',
      'title': 'Starbucks',
      'subtitle': 'today',
      'amount': '-\$150.00',
      'color': Colors.red,
    },
    {
      'image': 'asset/images/up2.png',
      'title': 'Transfer',
      'subtitle': 'Yesterday',
      'amount': '+\$85.00',
      'color': const Color.fromARGB(255, 238, 242, 238),
    },
    {
      'image': 'asset/images/up4.png',
      'title': 'Youtube',
      'subtitle': 'jan 16,2022',
      'amount': '-\$11.99',
      'color': Colors.red,
    },
  ];

  final List<String> dropdown = [
    'Income', 
  'Expense'];
  String? selectedValue = 'Expense';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: AppBar(
            backgroundColor: Colors.white,
            title: Row(
              
              children: [
                Icon(Icons.arrow_back),
                SizedBox(width: 80),
                Text('Statistics'),
                Spacer(),
                Icon(Icons.vertical_align_bottom_rounded),
              ],
            ),
            bottom: TabBar(
              padding: EdgeInsets.all(12),
              indicatorSize: TabBarIndicatorSize.tab,
              splashFactory: NoSplash.splashFactory,
              indicator: BoxDecoration(
                color: kThirdcolor,
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: 'Day'),
                Tab(text: 'Week'),
                Tab(text: 'Month'),
                Tab(text: 'Year'),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 120,
                    height: 50,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(15),
                        items: dropdown
                            .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(value),
                                ),
                              );
                            })
                            .toList(),
                        value: selectedValue,
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        icon: Icon(Icons.keyboard_arrow_down_sharp),
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    child: LineChartSample2(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Top Spending',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(width: 190,),
          Icon(Icons.arrow_circle_down),
                          ],
                        ),
                      
                        SizedBox(height: 40),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: transactions.length,
                          itemBuilder: (context, index) {
                            final transaction = transactions[index];
                            final isSecondContainer = index == 1;
                            return Container(
                              
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                
                                
                                borderRadius: BorderRadius.circular(10),
                                
                                color: isSecondContainer ? Color(0xff29756F) : Colors.white.withOpacity(0.2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey.shade200,
                                    child: Image.asset(transaction['image'] as String, fit: BoxFit.cover),
                                  ),
                                  SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        transaction['title'] as String,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: isSecondContainer ? Colors.white : Colors.black,
                                        ),
                                      ),
                                      Text(
                                        transaction['subtitle'] as String,
                                        style: TextStyle(
                                          color: isSecondContainer ? Colors.white : Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    transaction['amount'] as String,
                                    style: TextStyle(
                                      color: transaction['color'] as Color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


