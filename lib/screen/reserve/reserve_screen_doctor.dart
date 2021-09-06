import 'package:flutter/material.dart';
import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/model/choose_model.dart';
import 'package:flutter_medical/screen/reserve/widget/choose_date.dart';
import 'package:flutter_medical/screen/reserve/widget/choose_time_group.dart';
import 'package:flutter_medical/screen/reserve/widget/user_info.dart';
import 'package:flutter_medical/screen/welcome/welcome_screen_doctor.dart';
import 'package:flutter_medical/widget/my_header.dart';

class ReserveScreenDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MyHeader(
            height: 258,
            imageUrl: 'assets/images/avatar_head.png',
            child: Column(
              children: <Widget>[
                UserInfo(new Key("Doctor name"), "John Doe"),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [mBackgroundColor, mSecondBackgroundColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ChooseSlot(),
                  SizedBox(
                    height: 32,
                  ),
                  ChooseTimeGroup(
                    title: 'Morning',
                    list: [
                      ChooseModel('09.00 AM'),
                      ChooseModel('09.30 AM', check: true),
                      ChooseModel('10.30 AM'),
                      ChooseModel('11.00 AM'),
                      ChooseModel('11.30 AM'),
                      ChooseModel('12.00 AM'),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  ChooseTimeGroup(
                    title: 'Afternoon',
                    list: [
                      ChooseModel('02.00 PM'),
                      ChooseModel('02.30 PM'),
                      ChooseModel('03.00 PM'),
                      ChooseModel('03.30 PM'),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  ChooseTimeGroup(
                    title: 'Evening',
                    list: [
                      ChooseModel('06.00 PM'),
                      ChooseModel('06.30 PM'),
                      ChooseModel('07.00 PM'),
                      ChooseModel('07.30 PM'),
                      ChooseModel('08.00 PM'),
                      ChooseModel('08.30 PM'),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
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

class ChooseSlot extends StatelessWidget {
  const ChooseSlot({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Select a Day',
          style: TextStyle(
            color: mTitleTextColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ChooseDate(
              week: 'Mon',
              date: '26',
            ),
            ChooseDate(
              week: 'Tue',
              date: '27',
              check: true,
            ),
            ChooseDate(
              week: 'Wed',
              date: '28',
            ),
            ChooseDate(
              week: 'Thu',
              date: '29',
            ),
            ChooseDate(
              week: 'Fri',
              date: '30',
            ),
            ChooseDate(
              week: 'Sat',
              date: '31',
            ),
          ],
        ),
      ],
    );
  }
}
