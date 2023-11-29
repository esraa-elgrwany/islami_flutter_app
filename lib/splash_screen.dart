import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_project/homeScreen.dart';
import 'package:islami_project/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget{
 static const String routeName="splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,MaterialPageRoute(builder:
      (context) =>  HomeScreen()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Scaffold(
      body:pro.modeApp==ThemeMode.light?Image.asset("assets/images/splash.png",width: double.infinity
        ,fit: BoxFit.fill,)
          :Image.asset("assets/images/dark_back.png",width: double.infinity
        ,fit: BoxFit.fill,)
    );
  }
}
