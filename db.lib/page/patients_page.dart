import 'package:final_db_test/model/patient.dart';
import 'package:final_db_test/page/edit_patient_page.dart';
import 'package:final_db_test/widget/patient_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:final_db_test/db/patients_database.dart';
import 'patient_detail_page.dart';

class PatientsPage extends StatefulWidget {
  @override
  _PatientsPageState createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
  late List<Patient> patients;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshPatients();
  }

  @override
  void dispose() {
    PatientsDatabase.instance.close();
    super.dispose();
  }

  Future refreshPatients() async {
    setState(() => isLoading = true);
    this.patients = await PatientsDatabase.instance.readAllPatients();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text(
            'Patients',
            style: TextStyle(fontSize: 24),
          ),
          actions: [Icon(Icons.search), SizedBox(width: 12)],
        ),
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : patients.isEmpty
              ? Text(
            'No Patients',
            style: TextStyle(color: Colors.white, fontSize: 24),
          )
              : buildPatients(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditPatientPage()),
            );

            refreshPatients();
          },
        ),
      );

  Widget buildPatients() =>
      StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(8),
        itemCount: patients.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final patient = patients[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PatientDetailPage(patientId: patient.id!),
              ));

              refreshPatients();
            },
            child: PatientCardWidget(patient: patient, index: index),
          );
        },
      );
}