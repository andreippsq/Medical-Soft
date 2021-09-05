import 'package:final_db_test/model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:final_db_test/db/doctors_database.dart';
import 'package:final_db_test/widget/doctor_form_widget.dart';

class AddEditDoctorPage extends StatefulWidget {
  final Doctor? doctor;

  const AddEditDoctorPage({
    Key? key,
    this.doctor,
  }) : super(key: key);
  @override
  _AddEditDoctorPageState createState() => _AddEditDoctorPageState();
}

class _AddEditDoctorPageState extends State<AddEditDoctorPage> {
  final _formKey = GlobalKey<FormState>();
  late String firstName;
  late String lastName;
  late String specialty;
  late String sealCode;
  late String institution;
  late String email;
  late String password;
  late String phoneNumber;

  @override
  void initState() {
    super.initState();

    firstName = widget.doctor?.firstName ?? '';
    lastName = widget.doctor?.lastName ?? '';
    specialty = widget.doctor?.specialty ?? '';
    sealCode = widget.doctor?.sealCode ?? '';
    institution = widget.doctor?.institution ?? '';
    email = widget.doctor?.email ?? '';
    password = widget.doctor?.password ?? '';
    phoneNumber = widget.doctor?.phoneNumber ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [buildButton()],
    ),
    body: Form(
      key: _formKey,
      child: DoctorFormWidget(
        firstName: firstName,
        lastName: lastName,
        specialty: specialty,
        sealCode: sealCode,
        institution: institution,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        onChangedFirstName: (firstName) => setState(() => this.firstName = firstName),
        onChangedLastName: (lastName) => setState(() => this.lastName = lastName),
        onChangedSpecialty: (specialty) => setState(() => this.specialty = specialty),
        onChangedSealCode: (seal) => setState(() => this.sealCode = seal),
        onChangedInstitution: (institution) => setState(() => this.institution = institution),
        onChangedEmail: (email) => setState(() => this.email = email),
        onChangedPassword: (password) => setState(() => this.password = password),
        onChangedPhoneNumber: (phone) => setState(() => this.phoneNumber = phone),
      ),
    ),
  );

  Widget buildButton() {
    final isFormValid = firstName.isNotEmpty && lastName.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateDoctor,
        child: Text('Save'),
      ),
    );
  }

  void addOrUpdateDoctor() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.doctor != null;

      if (isUpdating) {
        await updateDoctor();
      } else {
        await addDoctor();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateDoctor() async {
    final doctor = widget.doctor!.copy(
      firstName: firstName,
      lastName: lastName,
      specialty: specialty,
      sealCode: sealCode,
      institution: institution,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );

    await DoctorsDatabase.instance.updateDoctor(doctor);
  }

  Future addDoctor() async {
    final doctor = Doctor(
      firstName: firstName,
      lastName: lastName,
      specialty: specialty,
      sealCode: sealCode,
      institution: institution,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );

    await DoctorsDatabase.instance.createDoctor(doctor);
  }
}
