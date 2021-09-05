import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoctorFormWidget extends StatelessWidget {
  final String? firstName;
  final String? lastName;
  final String? specialty;
  final String? sealCode;
  final String? institution;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final ValueChanged<String> onChangedFirstName;
  final ValueChanged<String> onChangedLastName;
  final ValueChanged<String> onChangedSpecialty;
  final ValueChanged<String> onChangedSealCode;
  final ValueChanged<String> onChangedInstitution;
  final ValueChanged<String> onChangedEmail;
  final ValueChanged<String> onChangedPassword;
  final ValueChanged<String> onChangedPhoneNumber;

  const DoctorFormWidget({
    Key? key,
    this.firstName = '',
    this.lastName = '',
    this.specialty = '',
    this.sealCode = '',
    this.institution = '',
    this.email = '',
    this.password = '',
    this.phoneNumber = '',
    required this.onChangedFirstName,
    required this.onChangedLastName,
    required this.onChangedSpecialty,
    required this.onChangedSealCode,
    required this.onChangedInstitution,
    required this.onChangedEmail,
    required this.onChangedPassword,
    required this.onChangedPhoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildFirstName(),
          SizedBox(height: 8),
          buildLastName(),
          SizedBox(height: 8),
          buildSpecialty(),
          SizedBox(height: 8),
          buildSealCode(),
          SizedBox(height: 8),
          buildInstitution(),
          SizedBox(height: 8),
          buildEmail(),
          SizedBox(height: 8),
          buildPassword(),
          SizedBox(height: 8),
          buildPhoneNumber(),
          SizedBox(height: 16),
        ],
      ),
    ),
  );

  Widget buildFirstName() => TextFormField(
    maxLines: 1,
    initialValue: firstName,
    style: TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'First Name',
      hintStyle: TextStyle(color: Colors.white70),
    ),
    validator: (firstName) =>
    firstName != null && firstName.isEmpty ? 'First name field cannot be empty' : null,
    onChanged: onChangedFirstName,
  );

  Widget buildLastName() => TextFormField(
    maxLines: 1,
    initialValue: lastName,
    style: TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Last Name',
      hintStyle: TextStyle(color: Colors.white70),
    ),
    validator: (lastName) =>
    lastName != null && lastName.isEmpty ? 'Last name field cannot be empty' : null,
    onChanged: onChangedLastName,
  );

  Widget buildSealCode() => TextFormField(
    maxLines: 1,
    initialValue: sealCode,
    style: TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Seal Code',
      hintStyle: TextStyle(color: Colors.white70),
    ),
    validator: (sealCode) =>
    sealCode != null && sealCode.isEmpty ? 'Seal code field cannot be empty' : null,
    onChanged: onChangedSealCode,
  );

  Widget buildSpecialty() => TextFormField(
    maxLines: 1,
    initialValue: specialty,
    style: TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Specialty',
      hintStyle: TextStyle(color: Colors.white70),
    ),
    validator: (specialty) =>
    specialty != null && specialty.isEmpty ? 'Specialty field cannot be empty' : null,
    onChanged: onChangedSpecialty,
  );

  Widget buildInstitution() => TextFormField(
    maxLines: 1,
    initialValue: institution,
    style: TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Institution',
      hintStyle: TextStyle(color: Colors.white70),
    ),
    validator: (institution) =>
    institution != null && institution.isEmpty ? 'Institution field cannot be empty' : null,
    onChanged: onChangedInstitution,
  );

  Widget buildEmail() => TextFormField(
    maxLines: 1,
    initialValue: email,
    style: TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Email',
      hintStyle: TextStyle(color: Colors.white70),
    ),
    validator: (email) =>
    email != null && email.isEmpty ? 'Email field cannot be empty' : null,
    onChanged: onChangedEmail,
  );

  Widget buildPassword() => TextFormField(
    maxLines: 1,
    initialValue: password,
    style: TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    obscureText: true,
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Password',
      hintStyle: TextStyle(color: Colors.white70),
    ),
    validator: (password) =>
    password != null && password.isEmpty ? 'Password field cannot be empty' : null,
    onChanged: onChangedPassword,
  );

  Widget buildPhoneNumber() => TextFormField(
    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
    maxLines: 1,
    initialValue: phoneNumber,
    style: TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Phone Number',
      hintStyle: TextStyle(color: Colors.white70),
    ),
    validator: (phone) =>
    phone != null && phone.isEmpty ? 'Phone number cannot be empty' : null,
    onChanged: onChangedPhoneNumber,
  );
}
