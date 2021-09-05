import 'package:final_db_test/model/doctor.dart';
import 'package:final_db_test/page/edit_doctor_page.dart';
import 'package:flutter/material.dart';
import 'package:final_db_test/db/doctors_database.dart';

class DoctorDetailPage extends StatefulWidget {
  final int doctorId;

  const DoctorDetailPage({
    Key? key,
    required this.doctorId,
  }) : super(key: key);

  @override
  _DoctorDetailPageState createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  late Doctor doctor;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshDoctor();
  }

  Future refreshDoctor() async {
    setState(() => isLoading = true);
    this.doctor = await DoctorsDatabase.instance.readDoctor(widget.doctorId);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [editButton(), deleteButton()],
    ),
    body: isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
      padding: EdgeInsets.all(12),
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children: [
          Text(
            doctor.firstName + ' ' + doctor.lastName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            doctor.specialty
          ),
          SizedBox(height: 8),
          Text(
            doctor.sealCode,
          ),
          SizedBox(height: 8),
          Text(
              doctor.institution
          ),
          SizedBox(height: 8),
          Text(
            doctor.email,
          ),
          SizedBox(height: 8),
          Text(
              doctor.password
          ),
          SizedBox(height: 8),
          Text(
            doctor.phoneNumber,
          )
        ],
      ),
    ),
  );

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditDoctorPage(doctor: doctor),
        ));

        refreshDoctor();
      });

  Widget deleteButton() => IconButton(
    icon: Icon(Icons.delete),
    onPressed: () async {
      await DoctorsDatabase.instance.deleteDoctor(widget.doctorId);

      Navigator.of(context).pop();
    },
  );
}