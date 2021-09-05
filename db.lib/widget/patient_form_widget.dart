import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PatientFormWidget extends StatelessWidget {
  final String? firstName;
  final String? lastName;
  final String? address;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? age;
  final ValueChanged<String> onChangedFirstName;
  final ValueChanged<String> onChangedLastName;
  final ValueChanged<String> onChangedAddress;
  final ValueChanged<String> onChangedEmail;
  final ValueChanged<String> onChangedPassword;
  final ValueChanged<String> onChangedPhoneNumber;
  final ValueChanged<String> onChangedAge;

  const PatientFormWidget({
    Key? key,
    this.firstName = '',
    this.lastName = '',
    this.address = '',
    this.email = '',
    this.password = '',
    this.phoneNumber = '',
    this.age = '',
    required this.onChangedFirstName,
    required this.onChangedLastName,
    required this.onChangedAddress,
    required this.onChangedEmail,
    required this.onChangedPassword,
    required this.onChangedPhoneNumber,
    required this.onChangedAge,
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
          buildAddress(),
          SizedBox(height: 8),
          buildEmail(),
          SizedBox(height: 8),
          buildPassword(),
          SizedBox(height: 8),
          buildPhoneNumber(),
          SizedBox(height: 8),
          buildAge(),
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

  Widget buildAddress() => TextFormField(
    maxLines: 1,
    initialValue: address,
    style: TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Address',
      hintStyle: TextStyle(color: Colors.white70),
    ),
    validator: (address) =>
    address != null && address.isEmpty ? 'Address field cannot be empty' : null,
    onChanged: onChangedAddress,
  );

  Widget buildAge() => TextFormField(
    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
    maxLines: 1,
    initialValue: age,
    style: TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Age',
      hintStyle: TextStyle(color: Colors.white70),
    ),
    validator: (age) =>
    age != null && age.isEmpty ? 'Age cannot be empty' : null,
    onChanged: onChangedAge,
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
