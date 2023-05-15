import 'dart:async';

import 'package:bmi_calculator/login.dart';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class bmi extends StatefulWidget{
  @override
  State<bmi> createState() => bmiState();
}

class bmiState extends State<bmi> {
    static const String KEYLOGIN ="login";
  @override
  void initState() {
    super.initState();

   whereToGo();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(

              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/BMI CALCULATOR.png'),
            )
          ],
        ),
      ),
    ),

  );
  }

  Future<void> whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn =sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2),(){
      if(isLoggedIn!=null){
        if(isLoggedIn){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));



        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()));

        }
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()));

      }
    });
  }
}