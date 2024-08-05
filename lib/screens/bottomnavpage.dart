import 'package:flutter/material.dart';
import 'package:ramees/screens/addexpensepage.dart';
import 'package:ramees/screens/homepage.dart';
import 'package:ramees/screens/profilepage.dart';
import 'package:ramees/screens/statisticspage.dart';
import 'package:ramees/screens/walletpage.dart';

import 'package:ramees/util/constants.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  List<Widget> screens = [
    HomeContent(),
    StatisticsPage(),
    WalletPage(),
    ProfilePage(),
  ];
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Color(0xffAAAAAA),
        elevation: 1,
        backgroundColor: Colors.white,
        selectedItemColor: kThirdcolor,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedindex,
        onTap: (value) {
          setState(() {
            selectedindex = value;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 40,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.leaderboard_outlined,
              size: 40,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet_outlined,
              size: 40,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_outlined,
              size: 40,
            ),
            label: '',
          ),
        ],
      ),
      floatingActionButton: selectedindex==0? FloatingActionButton(
              backgroundColor: kThirdcolor,
              child: const Icon(Icons.add),
              shape: const CircleBorder(),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddExpensePage(
                      onAddExpense: (title, amount, image) {},
                    ),
                  ),
                  
                );
              },
              
            ):null,
          
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: screens[selectedindex],
    );
  }
}
