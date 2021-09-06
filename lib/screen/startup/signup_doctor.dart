import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/model/doctor.dart';
import 'package:flutter_medical/screen/welcome/welcome_screen_doctor.dart';

class SignUpDoctor extends StatefulWidget {
  final Function onLogInDoctorSelected;

  SignUpDoctor({@required this.onLogInDoctorSelected});

  @override
  _SignUpDoctorState createState() => _SignUpDoctorState();
}

class _SignUpDoctorState extends State<SignUpDoctor> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final specialtyController = TextEditingController();
  final sealController = TextEditingController();
  final institutionController = TextEditingController();
  final emailController = TextEditingController();
  final confirmEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final telephoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.height > 770
          ? 64
          : size.height > 670
          ? 32
          : 16),
      child: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: size.height *
                (size.height > 770
                    ? 0.7
                    : size.height > 670
                    ? 0.8
                    : 0.9),
            width: 500,
            color: Colors.white,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "DOCTOR REGISTRATION",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 30,
                        child: Divider(
                          color: kPrimaryColor,
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
                        controller: firstNameController,
                        maxLength: 30,
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          labelText: 'First Name',
                          suffixIcon: Icon(
                            Icons.person_outline,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
                        controller: lastNameController,
                        maxLength: 30,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          labelText: 'Last Name',
                          suffixIcon: Icon(
                            Icons.person_outline,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
                        controller: specialtyController,
                        maxLength: 25,
                        decoration: InputDecoration(
                          hintText: 'Medical Specialty',
                          labelText: 'Medical Specialty',
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
                        controller: sealController,
                        maxLength: 20,
                        decoration: InputDecoration(
                          hintText: 'Seal Code',
                          labelText: 'Seal Code',
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
                        controller: institutionController,
                        maxLength: 50,
                        decoration: InputDecoration(
                          hintText: 'Institution',
                          labelText: 'Institution',
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
                        controller: emailController,
                        maxLength: 40,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          suffixIcon: Icon(
                            Icons.mail_outline,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
                        controller: confirmEmailController,
                        maxLength: 40,
                        decoration: InputDecoration(
                          hintText: 'Confirm Email',
                          labelText: 'Confirm Email',
                          suffixIcon: Icon(
                            Icons.mail_outline,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
                        controller: passwordController,
                        maxLength: 25,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          suffixIcon: Icon(
                            Icons.lock_outline,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      TextField(
                        controller: telephoneController,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                        maxLength: 15,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          labelText: 'Phone Number',
                        ),
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: kPrimaryColor,
                          minimumSize: Size(80, 50),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        onPressed: () {
                          String firstName = firstNameController.text;
                          String lastName = lastNameController.text;
                          String specialty = specialtyController.text;
                          String seal = sealController.text;
                          String institution = institutionController.text;
                          String email = emailController.text;
                          String confirmEmail = confirmEmailController.text;
                          String password = passwordController.text;
                          String telephone = telephoneController.text;

                          if(firstName.isEmpty || lastName.isEmpty || specialty.isEmpty || seal.isEmpty || institution.isEmpty || email.isEmpty || confirmEmail.isEmpty || password.isEmpty || telephone.isEmpty){
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Warning'),
                                  content:
                                  Text("None of the fields can be empty!"),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Back'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          else{
                            if(email != confirmEmail){
                              showDialog<void>(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Warning'),
                                    content:
                                    Text("Email addresses do not match!"),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('Back'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                            else{
                              if(!EmailValidator.validate(email)){
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Warning'),
                                      content:
                                      Text("Invalid email format!"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('Back'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                              else{
                                Doctor doctor = new Doctor(firstName: firstName, lastName: lastName,
                                specialty: specialty, sealCode: seal, institution: institution,
                                email: email, password: password, phoneNumber: telephone);
                                print(doctor.toString());

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => WelcomeScreenDoctor()),
                                );
                              }
                            }
                          }
                        },
                        child: Text('CREATE ACCOUNT',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.onLogInDoctorSelected();
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Log In",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: kPrimaryColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}