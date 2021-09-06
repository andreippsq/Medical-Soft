import 'package:flutter/material.dart';
import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/screen/forum/forum_doctor.dart';
import 'package:flutter_medical/screen/medicalresources/medical_resources_doctor.dart';
import 'package:flutter_medical/screen/patientfiles/patient_files_doctor.dart';
import 'package:flutter_medical/screen/patientregister/patient_register_doctor.dart';
import 'package:flutter_medical/screen/reserve/reserve_screen_doctor.dart';
import 'package:flutter_medical/screen/startup/login_page_doctor.dart';
import 'package:flutter_medical/screen/statistics/statistics.dart';
import 'package:flutter_medical/screen/therapyjournal/therapy_journal_doctor.dart';
import 'package:flutter_medical/screen/videoconference/video_conference_doctor.dart';
import 'package:flutter_medical/widget/header_logo.dart';
import 'package:flutter_medical/widget/menu_card.dart';
import 'package:flutter_medical/widget/my_header.dart';

class WelcomeScreenDoctor extends StatelessWidget {
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
                            'Our Health\nServices',
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
                          imageUrl: 'assets/images/general_practice.png',
                          title: 'Doctor Appointments',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ReserveScreenDoctor();
                                },
                              ),
                            );
                          },
                        ),
                        MenuCard(
                          imageUrl: 'assets/images/sexual_health.png',
                          title: 'Patients - Register',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PatientRegisterDoctor();
                                },
                              ),
                            );
                          },
                        ),
                        MenuCard(
                          imageUrl: 'assets/images/immunisation.png',
                          title: 'Medical Files',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PatientFilesDoctor();
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
                          title: 'Forum',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ForumDoctor();
                                },
                              ),
                            );
                          },
                        ),
                        MenuCard(
                          imageUrl: 'assets/images/immunisation.png',
                          title: 'Medical Resources',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MedicalResourcesDoctor();
                                },
                              ),
                            );
                          },
                        ),
                        MenuCard(
                          imageUrl: 'assets/images/immunisation.png',
                          title: 'Statistics',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Statistics();
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
                          imageUrl: 'assets/images/immunisation.png',
                          title: 'Therapy Journals',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return TherapyJournalDoctor();
                                },
                              ),
                            );
                          },
                        ),
                        MenuCard(
                          imageUrl: 'assets/images/sexual_health.png',
                          title: 'Video Conference',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MeetingDoctor();
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
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.black87,
                            primary: Colors.redAccent[400],
                            minimumSize: Size(80, 50),
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(18)),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DoctorLoginPage()),
                            );
                          },
                          child: Text('LOGOUT',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 28,
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
