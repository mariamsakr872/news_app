import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/pages/home/home_view.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   Timer(
     const Duration(seconds: 3),
     () {
       Navigator.pushReplacementNamed(context, HomeView.routeName);
     },
   );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png",),
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        body:  Center(child: Image.asset("assets/images/logo.png"))
      ),
    );
  }
}
