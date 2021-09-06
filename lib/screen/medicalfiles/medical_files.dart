import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical/constant.dart';
import 'package:flutter_medical/screen/startup/startup_screen.dart';
import 'package:flutter_medical/screen/welcome/welcome_screen_doctor.dart';


class MedicalFiles extends StatefulWidget {
  @override
  _MedicalFilesState createState() => _MedicalFilesState();
}

class _MedicalFilesState extends State<MedicalFiles> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> patientListOnSearch = [];
  List<String> patientList = [
    'Andrei',
    'Alex',
    'Mircea',
    'Dani',
    'Luiz',
    'Seven',
    'Opt',
    'Patient9',
    'patient10',
    'patient11',
    'patient12',
    'patient13',
    'patient14',
    'patient15',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Medical Files")),
        appBar: AppBar(
          title: Row(
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        patientListOnSearch = patientList
                            .where((element) => element
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                    controller: _textEditingController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Search'
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                patientListOnSearch.clear();
                _textEditingController.clear();
                setState(() {
                  _textEditingController.text = '';
                });
              },
              child: Icon(
                Icons.close,
                color: Colors.red,
              ),
            )
          ],
        ),
        body: _textEditingController.text.isNotEmpty &&
            patientListOnSearch.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_off,
                size: 80,
              ),
              Text(
                'No results found',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
            : Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text(
                      'MEDICAL FILES',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
                    )
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    //child: Container(
                     // child: Image.asset('assets/medical_files_image.png', height: 250, width: 250,),
                   // )
                ),
                Container(
                  height:MediaQuery.of(context).size.height,
                  child:ListView.builder(
                      itemCount: _textEditingController.text.isNotEmpty
                          ? patientListOnSearch.length
                          : patientList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Icon(Icons.account_circle),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                _textEditingController.text.isNotEmpty
                                    ? patientListOnSearch[index]
                                    : patientList[index],
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        child: Text("Back"),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WelcomeScreenDoctor()),
                          );
                        },
                      ),
                    ]
                ),
              ],
            ),
          ),

        )
    );


  }
}
