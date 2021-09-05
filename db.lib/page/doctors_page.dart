import 'package:final_db_test/model/doctor.dart';
import 'package:final_db_test/page/edit_doctor_page.dart';
import 'package:final_db_test/widget/doctor_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:final_db_test/db/doctors_database.dart';

import 'doctor_detail_page.dart';

class DoctorsPage extends StatefulWidget {
  @override
  _DoctorsPageState createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  late List<Doctor> doctors;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshDoctors();
  }

  @override
  void dispose() {
    DoctorsDatabase.instance.close();
    super.dispose();
  }

  Future refreshDoctors() async {
    setState(() => isLoading = true);
    this.doctors = await DoctorsDatabase.instance.readAllDoctors();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        'Doctors',
        style: TextStyle(fontSize: 24),
      ),
      actions: [Icon(Icons.search), SizedBox(width: 12)],
    ),
    body: Center(
      child: isLoading
          ? CircularProgressIndicator()
          : doctors.isEmpty
          ? Text(
        'No Doctors',
        style: TextStyle(color: Colors.white, fontSize: 24),
      )
          : buildDoctors(),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.add),
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AddEditDoctorPage()),
        );

        refreshDoctors();
      },
    ),
  );

  Widget buildDoctors() => StaggeredGridView.countBuilder(
    padding: EdgeInsets.all(8),
    itemCount: doctors.length,
    staggeredTileBuilder: (index) => StaggeredTile.fit(2),
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    itemBuilder: (context, index) {
      final doctor = doctors[index];

      return GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DoctorDetailPage(doctorId: doctor.id!),
          ));

          refreshDoctors();
        },
        child: DoctorCardWidget(doctor: doctor, index: index),
      );
    },
  );
}