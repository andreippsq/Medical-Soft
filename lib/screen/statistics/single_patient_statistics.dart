import 'package:flutter/material.dart';
import 'package:flutter_medical/screen/statistics/statistics.dart';
import 'package:flutter_medical/widget/header_logo.dart';
import 'package:flutter_medical/widget/my_header.dart';
import '../../constant.dart';

class SinglePatientStatistics extends StatelessWidget {
  String patName;

  SinglePatientStatistics(Key key, this.patName) : super(key: key);

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
                            this.patName,
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
                            "Statistics and Predictions",
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
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        width: 800,
                        child: DataTable(
                            columns:[
                              DataColumn(label: Text("Stat1")),
                              DataColumn(label: Text("Stat2")),
                              DataColumn(label: Text("Stat3")),
                            ],
                            rows:[
                              DataRow(cells:[
                                DataCell(Text("value1")),
                                DataCell(Text("value2")),
                                DataCell(Text("value3")),
                              ]),
                              DataRow(cells:[
                                DataCell(Text("value6")),
                                DataCell(Text("value7")),
                                DataCell(Text("value8")),
                              ])
                            ])
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
                                  MaterialPageRoute(builder: (context) => Statistics()),
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