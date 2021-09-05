import 'package:flutter/material.dart';
import 'package:final_db_test/page/patients_page.dart';
import 'package:final_db_test/page/doctors_page.dart';

class Homepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Homepage'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black87,
                  primary: Colors.white,
                  minimumSize: Size(80, 50),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PatientsPage()),
                  );
                },
                child: Text('PATIENTS',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black87,
                  primary: Colors.white,
                  minimumSize: Size(80, 50),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoctorsPage()),
                  );
                },
                child: Text('DOCTORS',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          )
        )
    );
  }
}