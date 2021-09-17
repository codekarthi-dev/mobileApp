import 'package:cyn/api/mobileLogin.dart';
import 'package:cyn/api/model/mobileLoginResponse.dart';
import 'package:cyn/screens/formPage.dart';
import 'package:cyn/screens/otpScreen.dart';
import 'package:cyn/widgets/forms.dart';
import 'package:cyn/widgets/section/card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class Details {
  final String aadharNumber;

  const Details({
    this.aadharNumber,
  });
}

class AadharPage extends StatefulWidget {
  @override
  _AadharPageState createState() => _AadharPageState();
}

class _AadharPageState extends State<AadharPage> {
  final LocalStorage storage = new LocalStorage('localstorage_app');

  String aadhar = "";
  var _aadharController = new TextEditingController();

  Future<MobileLoginResponse> futureLogin;

  @override
  void initState() {
    super.initState();

    futureLogin = fetchMobileLogin();
    print("hello");
  }

  @override
  Widget build(BuildContext context) {
    String authId = storage.getItem("authId");
    print("aadhar id is = " + authId);

    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<MobileLoginResponse>(
            future: futureLogin,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                storage.setItem("mobileAuthId", snapshot.data.jwt);

                return Container(
                  height: 5,
                  width: 5,
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Container();
            },
          ),
          Positioned(
            left: 24,
            top: 100,
            child: Container(
              height: 600,
              width: 350,
              child: Card(
                elevation: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              color: Colors.white70,
            ),
          ),
          Positioned(
            top: 550,
            left: 160,
            child: RaisedButton(
              elevation: 10,
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xFF01dcdc),
              onPressed: () {
                setState(() {
                  aadhar = _aadharController.text;
                });
                storage.setItem("aadharNo", aadhar);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OtpPage()
                      // Forms(
                      //     // aadhar: _aadharController.text,
                      //     ),
                      ),
                );
              },
            ),
          ),
          Positioned(
            left: 95,
            top: 170,
            child: Container(
              height: 200,
              width: 200,
              child: Image.asset("assets/svg/aadhar.png"),
            ),
          ),
          Align(
            alignment: Alignment.center,
            // top: 50,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 38, vertical: 146),
              child: TextFormField(
                controller: _aadharController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'This field cannot be left empty';
                  }
                },
                maxLength: 20,
                decoration: InputDecoration(
                  helperText: "Type your Aadhar Card Number :",
                  // icon: Icon(Icons.favorite),
                  labelText: 'Aadhar no:',
                  labelStyle: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF01dcdc),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
