import 'package:flutter/material.dart';
import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/screen/startup/login_doctor.dart';
import 'package:flutter_medical/screen/startup/signup_doctor.dart';
import 'package:flutter_medical/screen/startup/startup_screen.dart';

class DoctorLoginPage extends StatefulWidget {
  @override
  _DoctorLoginPageState createState() => _DoctorLoginPageState();
}

class _DoctorLoginPageState extends State<DoctorLoginPage> {
  Option selectedOption = Option.LogIn;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: double.infinity,
                  width: size.width / 2,
                  color: kPrimaryColor,
                ),
                Container(
                    height: double.infinity,
                    width: size.width / 2,
                    color: Colors.white),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CONNECT DOCTORS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "AND PATIENTS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.black87,
                        primary: Colors.white,
                        minimumSize: Size(80, 50),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StartupScreen()),
                        );
                      },
                      child: Text('GO BACK',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "HOLENDOMED",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),

              //Animation 2
              transitionBuilder: (widget, animation) =>
                  ScaleTransition(child: widget, scale: animation),

              child: selectedOption == Option.LogIn
                  ? LogInDoctor(
                onSignUpDoctorSelected: () {
                  setState(() {
                    selectedOption = Option.SignUp;
                  });
                },
              )
                  : SignUpDoctor(
                onLogInDoctorSelected: () {
                  setState(() {
                    selectedOption = Option.LogIn;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}