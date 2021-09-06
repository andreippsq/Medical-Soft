import 'package:flutter/material.dart';
import 'package:flutter_medical/screen/welcome/welcome_screen_patient.dart';
import 'package:flutter_medical/widget/header_logo.dart';
import 'package:flutter_medical/widget/my_header.dart';

import '../../constant.dart';

class PatientFiles extends StatefulWidget {
  @override
  _PatientFilesState createState() => _PatientFilesState();
}

class _PatientFilesState extends State<PatientFiles> {
  List<String> items = ["Diagnosis1", "Diagnosis2", "Diagnosis3"];
  List<String> items2 = ["Treatment1", "Treatment2", "Treatment3"];

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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Patient Files',
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
                          "Diagnoses",
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
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('${items[index]}'),
                          subtitle: Text('details'),
                        );
                      },
                    ),
                  ),
                  Text(
                    "Add medical documents",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Medical document",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ]
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(mYellowColor),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0)
                                    )
                                )
                            ),
                            child: Text("Choose Document"),
                            onPressed: (){
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(mYellowColor),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0)
                                    )
                                )
                            ),
                            child: Text("Upload Document"),
                            onPressed: (){
                            },
                          ),
                        ),
                      ]
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Current treatment",
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
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('${items2[index]}'),
                          subtitle: Text('details'),
                        );
                      },
                    ),
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
