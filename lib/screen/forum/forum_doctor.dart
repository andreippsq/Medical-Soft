import 'package:flutter/material.dart';
import 'package:flutter_medical/screen/welcome/welcome_screen_doctor.dart';
import 'package:flutter_medical/widget/header_logo.dart';
import 'package:flutter_medical/widget/my_header.dart';

import '../../constant.dart';

class ForumDoctor extends StatefulWidget {
  @override
  _ForumStateDoctor createState() => _ForumStateDoctor();
}

class _ForumStateDoctor extends State<ForumDoctor> {
  List<String> items = ["User1", "User2", "User3"];

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
                              'Forum',
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
                            child: Image.asset('assets/images/forum_image.png', height: 200, width: 200,),
                          )
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            var listNo = index + 1;
                            return ListTile(
                              title: Text('Comment ' + listNo.toString()),
                              subtitle: Text('${items[index]} - Posted on Date ' + listNo.toString()),
                            );
                          },
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Ask/Answer: ',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20),
                                )
                            ),
                            Container(
                              width: 200,
                              child: TextField(
                                decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(mButtonColor),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0)
                                      )
                                  )
                              ),
                              child: Text("Post"),
                              onPressed: (){ },
                            ),
                          ]
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
                                    MaterialPageRoute(builder: (context) => WelcomeScreenDoctor()),
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
        ],
      ),
    );
  }
}