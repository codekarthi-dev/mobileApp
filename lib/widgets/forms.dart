// @dart=2.12

import 'package:cyn/widgets/fields.dart';
import 'package:flutter/material.dart';
import 'package:cyn/screens/formPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:localstorage/localstorage.dart';

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final LocalStorage storage = new LocalStorage('localstorage_app');

  TextEditingController _dateOfBirth = TextEditingController();
  TextEditingController _gender = TextEditingController();

  TextEditingController _fullName = TextEditingController();
  TextEditingController _photo = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _pincode = TextEditingController();
  TextEditingController _classX = TextEditingController();
  TextEditingController _classXII = TextEditingController();
  TextEditingController _pan = TextEditingController();
  TextEditingController _drivingLicense = TextEditingController();
  TextEditingController _aadharCard = TextEditingController();
  TextEditingController _admissionLetter = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class Forms extends StatelessWidget {
  // final LocalStorage storage = new LocalStorage('localstorage_app');

  // TextEditingController _dateOfBirth = TextEditingController();
  // TextEditingController _gender = TextEditingController();

  // TextEditingController _fullName = TextEditingController();
  // TextEditingController _photo = TextEditingController();
  // TextEditingController _state = TextEditingController();
  // TextEditingController _city = TextEditingController();
  // TextEditingController _pincode = TextEditingController();
  // TextEditingController _classX = TextEditingController();
  // TextEditingController _classXII = TextEditingController();
  // TextEditingController _pan = TextEditingController();
  // TextEditingController _drivingLicense = TextEditingController();
  // TextEditingController _aadharCard = TextEditingController();
  // TextEditingController _admissionLetter = TextEditingController();

  // final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // print(storage.getItem("jwtResponse"));
    // print("the aadhar no: is" + aadhar!);
    return MaterialApp(
        home: Scaffold(
      body:
          // Form(
          //   key: _formkey,
          // color: Colors.white,
          ListView(
        key: _formkey,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 0, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white60,
            radius: 70,
            child: Image.asset("assets/svg/icon.png"),
          ),
          SizedBox(
            height: 35,
          ),
          Field(
            labelText: "Date dd/mm/yy",
            hinTtext: "Enter your Date",
            onSave: "dateOfBirth",
            textEditingController: _dateOfBirth,
          ),
          Field(
            labelText: "Gender",
            hinTtext: "Enter your Gender",
            onSave: "gender",
            textEditingController: _gender,
          ),
          Field(
            labelText: "Full Name",
            hinTtext: "Enter your Full Name",
            textEditingController: _fullName,
            onSave: "fullName",
          ),
          Field(
            labelText: "Photo",
            hinTtext: "Add your photo",
            onSave: "photo",
            textEditingController: _photo,
          ),
          Field(
              labelText: "State",
              hinTtext: "Enter your State",
              onSave: "state",
              textEditingController: _state),
          Field(
            labelText: "City",
            hinTtext: "Enter your City name",
            onSave: "city",
            textEditingController: _city,
          ),
          Field(
            labelText: "PIncode:",
            hinTtext: " Enter your PIncode",
            onSave: "pincode",
            textEditingController: _pincode,
          ),
          Field(
            labelText: "Class X certificate",
            hinTtext: "Upload your Class X certificate",
            onSave: "class X",
            textEditingController: _classX,
          ),
          Field(
            labelText: "Class XII certificate",
            hinTtext: "Upload your Class XII certificate",
            onSave: "class XII",
            textEditingController: _classXII,
          ),
          Field(
            labelText: "Pan ID",
            hinTtext: "Provide your Pan ID",
            onSave: "pan",
            textEditingController: _pan,
          ),
          Field(
            labelText: "Driving License:",
            hinTtext: "Upload your Driving License",
            onSave: "_drivingLicense",
            textEditingController: _drivingLicense,
          ),
          Field(
            labelText: "Aadhar Card",
            hinTtext: "Upload your Aadhar Card",
            onSave: "aadharCard",
            textEditingController: _aadharCard,
          ),
          Field(
            labelText: "Admission Letter",
            hinTtext: "Upload your Admission Letter",
            onSave: "admissionLetter",
            textEditingController: _admissionLetter,
          ),
          RaisedButton(
            color: Color(0xFF01dcdc),
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                RegistrationUser();
                print("Successful");
              } else {
                print("Unsuccessfull");
              }
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(color: Color(0xFF01dcdc), width: 2)),
            textColor: Colors.white,
            child: Text("Submit"),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    ));
  }

  Future RegistrationUser() async {
    // url to registration php script
    var APIURL =
        Uri.parse("https://service.cynapse.co.in/backendApi/api/create.php");

    Map mapeddate = {
      "date_of_birth": _dateOfBirth.text,
      "gender": _gender.text,
      "full_name": _fullName.text,
      "photo": _photo.text,
      "state": _state.text,
      "city": _city.text,
      "pincode": _pincode.text,
      "class_X": _classX.text,
      "class_XII": _classXII.text,
      "pan": _pan.text,
      "driving_license": _drivingLicense.text,
      "aadhar_card": _aadharCard.text,
      "admission_letter": _admissionLetter.text,
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(
      APIURL,
      body: jsonEncode(mapeddate),
      headers: {
        "Content-Type": "application/json; charset=utf-8",
        'Authorization': storage.getItem("mobileAuthId"),
      },
    );

    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    print("DATA: ${data}");
  }
}
