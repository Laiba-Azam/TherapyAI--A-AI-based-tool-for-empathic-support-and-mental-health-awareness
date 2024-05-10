import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fypp/constants/images.dart';
import 'package:fypp/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){//initizlize
    super.initState();
    //write code here for timing
    Timer(Duration(seconds: 15) , () { 
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Profile()));
    });
  }
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: Stack(
            children: [
              const Positioned(
                bottom: 40,
                child: Image(image:AssetImage(splash))),

            ],
          ),


    );
  }
}