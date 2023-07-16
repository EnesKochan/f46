import 'dart:async';

import 'package:f46/ui/costum_theme.dart';
import 'package:f46/views/welcome/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
        Timer(
            const Duration(seconds: 3),
                () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const OnBoardingPage())));
    return Scaffold(
      backgroundColor: AppColors.gri,
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(24),
        child: Text("Developed by F46 for Google OUA", textAlign: TextAlign.center, style: context.small,),
      ),
      body: SafeArea(child: Center(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Lottie.network(
          'https://firebasestorage.googleapis.com/v0/b/travelly-90e1c.appspot.com/o/travelly.json?alt=media&token=f787cd5a-f296-4ec7-926f-c697fe885c32', reverse: true, width: 240),
        ],
      ),
      
  )),
    );
  }
}