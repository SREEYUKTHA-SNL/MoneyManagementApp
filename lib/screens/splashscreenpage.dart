import 'package:flutter/material.dart';
import 'package:ramees/util/constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: kBackgroundcolor,
      body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [kBackgroundcolor, ksecondcolor],
                begin: Alignment.topCenter,
               end: Alignment.bottomCenter,
              ),
            ),
            child: Center(child:Image.asset('asset/images/mono.png'),
            ),
            ),
    );
  }
}