import 'package:flutter/material.dart';
import 'package:flutter_medical/screen/welcome/welcome_screen_doctor.dart';


class SinglePatientFiles extends StatefulWidget {
  @override
  _SinglePatientFilesState createState() => _SinglePatientFilesState();
}

class _SinglePatientFilesState extends State<SinglePatientFiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Single Patient Files")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Text(
                    'SINGLE PATIENT FILES',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 45),
                  )
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                ElevatedButton(
                  child: Text("Back"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeScreenDoctor()),
                    );
                  },
                ),
              ])
            ],
          ),
        ));
  }
}
