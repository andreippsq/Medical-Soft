import 'package:final_db_test/model/patient.dart';
import 'package:final_db_test/page/edit_patient_page.dart';
import 'package:flutter/material.dart';
import 'package:final_db_test/db/patients_database.dart';

class PatientDetailPage extends StatefulWidget {
  final int patientId;

  const PatientDetailPage({
    Key? key,
    required this.patientId,
  }) : super(key: key);

  @override
  _PatientDetailPageState createState() => _PatientDetailPageState();
}

class _PatientDetailPageState extends State<PatientDetailPage> {
  late Patient patient;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshPatient();
  }

  Future refreshPatient() async {
    setState(() => isLoading = true);
    this.patient = await PatientsDatabase.instance.readPatient(widget.patientId);
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
            patient.firstName + ' ' + patient.lastName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
              patient.address
          ),
          SizedBox(height: 8),
          Text(
            patient.email,
          ),
          SizedBox(height: 8),
          Text(
              patient.password
          ),
          SizedBox(height: 8),
          Text(
            patient.phoneNumber,
          ),
          SizedBox(height: 8),
          Text(
            patient.age,
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
          builder: (context) => AddEditPatientPage(patient: patient),
        ));

        refreshPatient();
      });

  Widget deleteButton() => IconButton(
    icon: Icon(Icons.delete),
    onPressed: () async {
      await PatientsDatabase.instance.deletePatient(widget.patientId);

      Navigator.of(context).pop();
    },
  );
}