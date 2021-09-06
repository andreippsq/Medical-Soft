import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/model/patient.dart';
import 'package:flutter_medical/screen/welcome/welcome_screen_patient.dart';

class SignUpPatient extends StatefulWidget {
  final Function onLogInPatientSelected;

  SignUpPatient({@required this.onLogInPatientSelected});

  @override
  _SignUpPatientState createState() => _SignUpPatientState();
}

class _SignUpPatientState extends State<SignUpPatient> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final confirmEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final telephoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

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
                        "PATIENT REGISTRATION",
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
                        controller: ageController,
                        maxLength: 3,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                        decoration: InputDecoration(
                          hintText: 'Age',
                          labelText: 'Age',
                          suffixIcon: Icon(
                            Icons.person_outline,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
                        controller: addressController,
                        maxLength: 80,
                        decoration: InputDecoration(
                          hintText: 'Address',
                          labelText: 'Address',
                          suffixIcon: Icon(
                            Icons.person_outline,
                          ),
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
                          String age = ageController.text;
                          String address = addressController.text;
                          String email = emailController.text;
                          String confirmEmail = confirmEmailController.text;
                          String password = passwordController.text;
                          String telephone = telephoneController.text;

                          if(firstName.isEmpty || lastName.isEmpty || age.isEmpty || address.isEmpty || email.isEmpty || confirmEmail.isEmpty || password.isEmpty || telephone.isEmpty){
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
                                Patient patient = new Patient(firstName: firstName, lastName: lastName,
                                age: int.parse(age), address: address, email: email, password: password,
                                phoneNumber: telephone);
                                print(patient.toString());

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => WelcomeScreenPatient()),
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
                              widget.onLogInPatientSelected();
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