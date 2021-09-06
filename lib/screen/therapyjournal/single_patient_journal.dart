import 'package:flutter/material.dart';
import 'package:flutter_medical/screen/therapyjournal/therapy_journal_doctor.dart';
import 'package:flutter_medical/widget/header_logo.dart';
import 'package:flutter_medical/widget/my_header.dart';

import '../../constant.dart';

class SinglePatientJournal extends StatelessWidget {
  String patName;

  SinglePatientJournal(Key key, this.patName) : super(key:key);

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
                            'Therapy ' + this.patName,
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
                            "Treatment",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ]
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        width: 800,
                        child: DataTable(
                            columns:[
                              DataColumn(label: Text("Treatment details")),
                            ],
                            rows:[
                              DataRow(cells:[
                                DataCell(Text("Treatment detail 1")),
                              ]),
                              DataRow(cells:[
                                DataCell(Text("Treatment detail 2")),
                              ]),
                              DataRow(cells:[
                                DataCell(Text("Treatment detail 3")),
                              ]),
                            ])
                    ),
                    SizedBox(
                      height: 8,
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
                              child: Text("Add treatment detail"),
                              onPressed: (){
                              },
                            ),
                          ),
                        ]
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "Other Recommendations",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ]
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                            width: 800,
                            child: DataTable(
                                columns:[
                                  DataColumn(label: Text("Recommendation")),
                                  DataColumn(label: Text("Date")),
                                ],
                                rows:[
                                  DataRow(cells:[
                                    DataCell(Text("Investigation 1")),
                                    DataCell(Text("Date 1")),
                                  ]),
                                  DataRow(cells:[
                                    DataCell(Text("Investigation 2")),
                                    DataCell(Text("Date 2")),
                                  ]),
                                  DataRow(cells:[
                                    DataCell(Text("Intervention 3")),
                                    DataCell(Text("Date 3")),
                                  ]),
                                ])
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
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
                              child: Text("Add recommendation"),
                              onPressed: (){
                              },
                            ),
                          ),
                        ]
                    ),
                    SizedBox(
                      height: 8,
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
                                  MaterialPageRoute(builder: (context) => TherapyJournalDoctor()),
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
          ),
        ],
      ),
    );
  }
}