import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/screen/welcome/welcome_screen_doctor.dart';

class LogInDoctor extends StatefulWidget {
  final Function onSignUpDoctorSelected;

  LogInDoctor({@required this.onSignUpDoctorSelected});

  @override
  _LogInDoctorState createState() => _LogInDoctorState();
}

class _LogInDoctorState extends State<LogInDoctor> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
            width: 530,
            color: Colors.white,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LOG IN - DOCTOR",
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
                        controller: passwordController,
                        obscureText: true,
                        maxLength: 25,
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
                          String email = emailController.text;
                          String password = passwordController.text;

                          if(email.isEmpty || password.isEmpty){
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
                              print("Email: " + email + " | Password: " + password);

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WelcomeScreenDoctor()),
                              );
                            }
                          }
                        },
                        child: Text('LOG IN',
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
                            "You do not have an account as a doctor?",
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
                              widget.onSignUpDoctorSelected();
                            },
                            child: Row(
                              children: [
                                Text(
                                  "SIGN UP AS DOCTOR",
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
