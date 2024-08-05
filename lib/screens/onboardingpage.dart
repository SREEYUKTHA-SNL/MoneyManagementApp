import 'package:flutter/material.dart';
import 'package:ramees/screens/bottomnavpage.dart';
import 'package:ramees/screens/homepage.dart';
import 'package:ramees/screens/login.dart';
import 'package:ramees/util/constants.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
          Image.asset(
            'asset/images/new.jpg',
            
          ),
        
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white, 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  Image.asset('asset/images/spend smarter save more.png'),
                 
                 
                  SizedBox(height: 10), 
                  Container(
                    height: 60,
                    width: 300,
                     decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [kgrad1, kgrad2],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                      
                      
                    }, child: Text('Get Started',style: TextStyle(color:Colors.white,fontSize: 18),)),
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
