import 'package:flutter/material.dart';
import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/screen/startup/login_page_doctor.dart';
import 'package:flutter_medical/screen/startup/login_page_patient.dart';
import 'package:flutter_medical/widget/header_logo.dart';
import 'package:flutter_medical/widget/my_header.dart';

class StartupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MyHeader(
            height: 535,
            width: 900,
            imageUrl: 'assets/images/welcome-page-image.jpg',
            child: HeaderLogo(),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [mBackgroundColor, mSecondBackgroundColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'HOLENDOMED',
                    style: TextStyle(
                        fontSize: 32,
                        color: mTitleTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'REVOLUTIONARY \n'
                    'MEDICAL APP ',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: mTitleTextColor),
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: FlatButton(
                      color: mButtonColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DoctorLoginPage();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Doctor Login',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: FlatButton(
                      color: mButtonColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PatientLoginPage();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Patient Registration',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
