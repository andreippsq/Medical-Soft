import 'package:flutter/material.dart';
import 'package:flutter_medical/screen/welcome/welcome_screen_patient.dart';
import 'package:flutter_medical/widget/header_logo.dart';
import 'package:flutter_medical/widget/my_header.dart';

import '../../constant.dart';

class PainMap extends StatefulWidget {
  @override
  _PainMapState createState() => _PainMapState();
}

class _PainMapState extends State<PainMap> {
  List<String> items = ["Episode1", "Episode2", "Episode3"];

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
                          'Pain Map',
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
                          "History",
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
                    "Add new pain event",
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
                              'Time: ',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16),
                            )
                        ),
                        Container(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration.collapsed(hintText: "time"),
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
                              'Location: ',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16),
                            )
                        ),
                        Container(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration.collapsed(hintText: "location"),
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
                              'Intensity: ',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16),
                            )
                        ),
                        Container(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration.collapsed(hintText: "intensity"),
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
                              'Additional context: ',
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
