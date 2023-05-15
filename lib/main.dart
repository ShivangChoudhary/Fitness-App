import 'dart:ui';

import 'package:bmi_calculator/BMI%20SPLASH.dart';
import 'package:bmi_calculator/exercise.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  bmi(),
                
        



    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    var wtController = TextEditingController();

    var htController = TextEditingController();
    var ageController = TextEditingController();

    var result ="";
    var fui ="";
    var bgcolor;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
        color: bgcolor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  label: Text("Enter your weight in Kgs"),
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(21),
                  ),
                  prefixIcon: Icon(Icons.monitor_weight_outlined),
                ),
                keyboardType: TextInputType.number,

              ),
              SizedBox(
                height: 11,
              ),
              TextField(
                controller: htController,
                decoration: InputDecoration(
                  label: Text('Enter your height in Cms'),
                  border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(21)),
                  prefixIcon: Icon(Icons.height_rounded)

                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 11,
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(
                    label: Text('Enter your Age In kg'),
                    prefixIcon: Icon(Icons.yard_outlined),
                    border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(21)),

                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 11,
              ),
              ElevatedButton(onPressed: (){
                var wt = wtController.text.toString();
                var ht = htController.text.toString();
                if(wt!=""&& ht!=""){
                  var iwt= int.parse(wt);
                  var iht = int.parse(ht);
                  var hmt = iht/100;
                  var bmi = iwt/(hmt*hmt);
                  var msg = "";
                  setState(() {
                    if(bmi<18.5){
                      msg="You are Underweight";
                      bgcolor=Colors.orangeAccent;

                    }else if(bmi>25){
                      msg="You are Overweight";
                      bgcolor=Colors.red;
                    }else{
                      msg="You are Fit";
                      bgcolor=Colors.greenAccent;
                    }
                  });
                  result="$msg \n Your bmr is : ${bmi.toStringAsFixed(1)} ";


                }else{
                  setState(() {
                    result="Please fil the details";
                  });

                };


              }, child: Text('Check Your BMI')),
              Text(result,style: TextStyle(fontSize: 20),),
            ElevatedButton(onPressed: (){
              var wt = wtController.text.toString();
              var ht = htController.text.toString();
              var ag = ageController.text.toString();
              var be="";
              if(wt!=""&& ht!=""&& ag!=""){
                var iwt= int.parse(wt);
                var iht = int.parse(ht);
                var iag = int.parse(ag);
                var bmr = 88.362 + (13.397 * iwt) + (4.799 * iht) -(5.677 *iag);
                setState(() {
                  be="You need to eat ";
                  bgcolor=Colors.white;


                });
                fui="$be :${bmr.toStringAsFixed(1)} Calories in a day";


              }else{
                setState(() {
                  fui="Please fil the details";
                });

              };

      },
        child: Text('Check BMR')),
              Text(fui,style: TextStyle(fontSize: 20),),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> work(),
                ));

              }, child:Text('Get your diet chart')),


            ],

          ),

        ),
      ),
    );
  }
}
