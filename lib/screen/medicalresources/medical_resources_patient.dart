import 'package:flutter/material.dart';
import 'package:flutter_medical/screen/welcome/welcome_screen_patient.dart';
import 'package:flutter_medical/widget/header_logo.dart';
import 'package:flutter_medical/widget/menu_card.dart';
import 'package:flutter_medical/widget/my_header.dart';

import '../../constant.dart';
import 'medical_resource_patient.dart';

class MedicalResourcesPatient extends StatefulWidget {
  @override
  _MedicalResourcesPatientState createState() => _MedicalResourcesPatientState();
}

class _MedicalResourcesPatientState extends State<MedicalResourcesPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MyHeader(
            height: 200,
            imageUrl: 'assets/images/welcome.png',
            child: Column(
              children: <Widget>[
                HeaderLogo(),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'HOLENDOMED',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
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
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Medical Resources',
                            style: TextStyle(
                              color: mTitleTextColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Image.asset('assets/images/medical_files_image.png', height: 180, width: 180,),
                        )
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MenuCard(
                          imageUrl: 'assets/images/general_practice.png',
                          title: 'Document 1',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MedicalResourcePatient(new Key("Resource"), 'Document 1');
                                },
                              ),
                            );
                          },
                        ),
                        MenuCard(
                          imageUrl: 'assets/images/sexual_health.png',
                          title: 'Document 2',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MedicalResourcePatient(new Key("Resource"), 'Document 2');
                                },
                              ),
                            );
                          },
                        ),
                        MenuCard(
                          imageUrl: 'assets/images/immunisation.png',
                          title: 'Document 3',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MedicalResourcePatient(new Key("Resource"), 'Document 3');
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MenuCard(
                          imageUrl: 'assets/images/sexual_health.png',
                          title: 'Document 4',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MedicalResourcePatient(new Key("Resource"), 'Document 4');
                                },
                              ),
                            );
                          },
                        ),
                        MenuCard(
                          imageUrl: 'assets/images/immunisation.png',
                          title: 'Document 5',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MedicalResourcePatient(new Key("Resource"), 'Document 5');
                                },
                              ),
                            );
                          },
                        ),
                        MenuCard(
                          imageUrl: 'assets/images/immunisation.png',
                          title: 'Document 6',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MedicalResourcePatient(new Key("Resource"), 'Document 6');
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(mButtonColor),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0)
                                      )
                                  )
                              ),
                              child: Text("Go back"),
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => WelcomeScreenPatient()),
                                );
                              },
                            ),
                          ),
                        ]
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}