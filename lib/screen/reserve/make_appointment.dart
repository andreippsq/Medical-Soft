import 'package:flutter/material.dart';
import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/screen/reserve/reserve_screen_patient.dart';
import 'package:flutter_medical/screen/welcome/welcome_screen_patient.dart';
import 'package:flutter_medical/widget/header_logo.dart';
import 'package:flutter_medical/widget/menu_card.dart';
import 'package:flutter_medical/widget/my_header.dart';

class MakeAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MyHeader(
            height: 333,
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
                            'Choose doctor',
                            style: TextStyle(
                              color: mTitleTextColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MenuCard(
                          imageUrl: 'assets/images/specialist.png',
                          title: 'Doctor 1',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ReserveScreenPatient(new Key("Appointment"), 'Doctor 1');
                                },
                              ),
                            );
                          },
                        ),
                        MenuCard(
                          imageUrl: 'assets/images/immunisation.png',
                          title: 'Doctor 2',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ReserveScreenPatient(new Key("Appointment"), 'Doctor 2');
                                },
                              ),
                            );
                          },
                        ),
                        MenuCard(
                          imageUrl: 'assets/images/specialist.png',
                          title: 'Doctor 3',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ReserveScreenPatient(new Key("Appointment"), 'Doctor 3');
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
                          title: 'Doctor 4',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ReserveScreenPatient(new Key("Appointment"), 'Doctor 4');
                                },
                              ),
                            );
                          },
                        ),
                        MenuCard(
                          imageUrl: 'assets/images/immunisation.png',
                          title: 'Doctor 5',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ReserveScreenPatient(new Key("Appointment"), 'Doctor 5');
                                },
                              ),
                            );
                          },
                        ),
                        MenuCard(
                          imageUrl: 'assets/images/immunisation.png',
                          title: 'Doctor 6',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ReserveScreenPatient(new Key("Appointment"), 'Doctor 6');
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      ],
                    ),
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