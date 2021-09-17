import 'package:cyn/api/generateOtp.dart';
import 'package:cyn/api/model/otp.dart';
import 'package:cyn/api/model/otpResult.dart';
import 'package:cyn/api/verifyOtp.dart';
import 'package:cyn/screens/formPage.dart';
import 'package:cyn/screens/verifyOtpPage.dart';
import 'package:cyn/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:localstorage/localstorage.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({Key key}) : super(key: key);

  @override
  _VerifyOtpPageState createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final LocalStorage storage = new LocalStorage('localstorage_app');

  Future<OtpResult> futureOtpResult;

  @override
  void initState() {
    String requestId = storage.getItem("requestId");
    String otpNo = storage.getItem("otp");
    String authId = storage.getItem("authId");

    futureOtpResult = verifyOtp(requestId, otpNo, authId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 10,
            top: 150,
            child: Container(
              height: 100,
              width: 350,
              child: Text(
                "Your available files in Digilocker are:",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF01dcdc)),
              ),
            ),
          ),
          // changed line 60 and 67 , remove 60 to 66 and chnage lone 67 to snapshot.hasdata
          FutureBuilder<OtpResult>(
            future: futureOtpResult,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // print("${snapshot.data.result.files}");
                return Positioned(
                  left: -3,
                  top: 190,
                  child: Container(
                    // color: Colors.blue,
                    height: 600,
                    width: 400,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.result.files.length,
                        itemBuilder: (context, index) {
                          // var file = snapshot.data.result.files[index];
                          // Text("${snapshot.data.result.files.toString()}");
                          print(snapshot.data.result.files[index].description);
                          // return ListTile(
                          //   leading: Icon(
                          //     Icons.file_present,
                          //     size: 30,
                          //     color: Color(0xFF01dcdc),
                          //   ),
                          //   title: Text(
                          //     snapshot.data.result.files[index].description,
                          //     style:
                          //         TextStyle(fontSize: 25, color: Colors.black),
                          //   ),
                          // );
                        }),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
          Positioned(
            top: 660,
            left: 125,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        // VerifyOtpPage()

                        Forms(),

                    //  FormPage()
                  ),
                );
              },
              color: Color(0xFF01dcdc),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFF01dcdc),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
