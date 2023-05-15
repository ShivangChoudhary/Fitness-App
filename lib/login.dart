import 'package:bmi_calculator/BMI%20SPLASH.dart';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget{
  @override

  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var usernameController = TextEditingController();
  var passwordController= TextEditingController();

   int selectedValue =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/BMI CALCULATOR.png'),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                label: Text("Username"),
                prefixIcon: Icon(Icons.supervised_user_circle_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ) ,
            ),
            SizedBox(
              height: 11,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                label: Text("Password"),
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            RadioListTile(value: 1,
                title: Text("Male"),
                groupValue: selectedValue,
                onChanged:handleRadio),

            RadioListTile(value: 2,
                title: Text("Female"),
                groupValue: selectedValue,
                onChanged:handleRadio),


            ElevatedButton(onPressed: () async {

              var sharedPref = await SharedPreferences.getInstance();
              sharedPref.setBool(bmiState.KEYLOGIN, true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));


            }, child: Text("Login"))
          ],
        ),
      ),
    );
  }

  void handleRadio(int? value) {
    print(value);
    setState(() {
      selectedValue = value!;
    });
  }
}