import 'dart:async';


import 'package:flutter/material.dart';
import 'package:fypp/chatbot.dart';

import 'package:fypp/constants/images.dart';
import 'package:fypp/login_screen.dart';
import 'package:fypp/main_screen.dart';
import 'package:fypp/week8.dart';
import 'package:fypp/nondepressed.dart';  // Import your PositiveScreen
import 'package:fypp/severe.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate=false;
  @override
  void initState(){//initizlize
  startanimation();
  }
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              AnimatedPositioned  (
                duration: const Duration(milliseconds:5000),
                bottom: animate? 10:-300,
                left: animate? 10:10,
                right:animate? 10:10,
                top: animate? 10:10,
                child:const Image(image:AssetImage(splash))),
            ],
          ),


    );
  }
Future startanimation() async{
   await Future.delayed(const Duration(milliseconds: 5000));
   setState(()=>animate=true);
   await Future.delayed(const Duration(milliseconds: 5000));
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Severe()));

  }
}