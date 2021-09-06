import 'package:flutter/material.dart';
import 'package:flutter_medical/screen/welcome/welcome_screen_patient.dart';
import 'package:flutter_medical/widget/header_logo.dart';
import 'package:flutter_medical/widget/my_header.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../constant.dart';

class Calendar extends StatelessWidget {
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
                            "Calendar",
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
                          Text(
                            "Patient Name",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Add details to calendar",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Frequency: ',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16),
                              )
                          ),
                          Container(
                            width: 200,
                            child: TextField(
                              decoration: InputDecoration.collapsed(hintText: "frequency"),
                            ),
                          ),
                        ]
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Duration: ',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16),
                              )
                          ),
                          Container(
                            width: 200,
                            child: TextField(
                              decoration: InputDecoration.collapsed(hintText: "duration"),
                            ),
                          ),
                        ]
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Other: ',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16),
                              )
                          ),
                          Container(
                            width: 200,
                            child: TextField(
                              decoration: InputDecoration.collapsed(hintText: "other details"),
                            ),
                          ),
                        ]
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(mButtonColor),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0)
                                    )
                                )
                            ),
                            child: Text("Add"),
                            onPressed: (){ },
                          ),
                        ]
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
                                  backgroundColor: MaterialStateProperty.all(
                                      mButtonColor),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              15.0)
                                      )
                                  )
                              ),
                              child: Text("Go back"),
                              onPressed: () {
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
