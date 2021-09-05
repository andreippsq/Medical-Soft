import 'package:final_db_test/model/patient.dart';
import 'package:flutter/material.dart';
import 'package:final_db_test/db/patients_database.dart';
import 'package:final_db_test/widget/patient_form_widget.dart';

class AddEditPatientPage extends StatefulWidget {
  final Patient? patient;

  const AddEditPatientPage({
    Key? key,
    this.patient,
  }) : super(key: key);
  @override
  _AddEditPatientPageState createState() => _AddEditPatientPageState();
}

class _AddEditPatientPageState extends State<AddEditPatientPage> {
  final _formKey = GlobalKey<FormState>();
  late String firstName;
  late String lastName;
  late String address;
  late String email;
  late String password;
  late String phoneNumber;
  late String age;

  @override
  void initState() {
    super.initState();

    firstName = widget.patient?.firstName ?? '';
    lastName = widget.patient?.lastName ?? '';
    address = widget.patient?.address ?? '';
    email = widget.patient?.email ?? '';
    password = widget.patient?.password ?? '';
    phoneNumber = widget.patient?.phoneNumber ?? '';
    age = widget.patient?.age ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [buildButton()],
    ),
    body: Form(
      key: _formKey,
      child: PatientFormWidget(
        firstName: firstName,
        lastName: lastName,
        address: address,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        age: age,
        onChangedFirstName: (firstName) => setState(() => this.firstName = firstName),
        onChangedLastName: (lastName) => setState(() => this.lastName = lastName),
        onChangedAddress: (address) => setState(() => this.address = address),
        onChangedEmail: (email) => setState(() => this.email = email),
        onChangedPassword: (password) => setState(() => this.password = password),
        onChangedPhoneNumber: (phone) => setState(() => this.phoneNumber = phone),
        onChangedAge: (age) => setState(() => this.age = age),
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
        onPressed: addOrUpdatePatient,
        child: Text('Save'),
      ),
    );
  }

  void addOrUpdatePatient() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.patient != null;

      if (isUpdating) {
        await updatePatient();
      } else {
        await addPatient();
      }

      Navigator.of(context).pop();
    }
  }

  Future updatePatient() async {
    final patient = widget.patient!.copy(
      firstName: firstName,
      lastName: lastName,
      address: address,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      age: age,
    );

    await PatientsDatabase.instance.updatePatient(patient);
  }

  Future addPatient() async {
    final patient = Patient(
      firstName: firstName,
      lastName: lastName,
      address: address,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      age: age,
    );

    await PatientsDatabase.instance.createPatient(patient);
  }
}
