import 'package:cyn/api/fileFetch.dart';
import 'package:cyn/api/generateOtp.dart';
import 'package:cyn/api/mobileLogin.dart';
import 'package:cyn/api/model/FetchFile.dart';
import 'package:cyn/api/model/mobileLoginResponse.dart';
import 'package:cyn/api/model/otp.dart';
import 'package:cyn/screens/formPage.dart';
import 'package:cyn/screens/verifyOtpPage.dart';
import 'package:cyn/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:localstorage/localstorage.dart';

// import 'package:thegorgeousotp/stores/login_store.dart';
// import 'package:thegorgeousotp/theme.dart';
// import 'package:thegorgeousotp/widgets/loader_hud.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  // final User _user;

  final LocalStorage storage = new LocalStorage('localstorage_app');

  String text = '';

  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
    print(text);
    print(storage.getItem("jwtResponse"));
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Text(
          text[position],
          style: TextStyle(color: Colors.black),
        )),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      );
    }
  }

  Future<Otp> futureOtp;
  // Future<mobileLoginResponse> futureLogin;
  Future<FetchFile> futureFile;

  @override
  void initState() {
    super.initState();
    String authId = storage.getItem("authId");
    String aadharNo = storage.getItem("aadharNo");
    String requestId = storage.getItem("requestId");

    // futureLogin = mobileLogin();
    print("hello");

    futureOtp = fetchOtp(authId, aadharNo);
    print("the aadhar id is" + authId + "aadhar no: is " + aadharNo);
    futureFile = fetchFileFromOtp(requestId, authId);
    print(requestId + "this is the req id");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 16,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: FutureBuilder<Otp>(
                            future: futureOtp,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                storage.setItem("requestId",
                                    "${snapshot.data.result.requestId}");
                                return Text(
                                  "Enter 6 digits otp code sent to your number",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500),
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              otpNumberWidget(0),
                              otpNumberWidget(1),
                              otpNumberWidget(2),
                              otpNumberWidget(3),
                              otpNumberWidget(4),
                              otpNumberWidget(5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: RaisedButton(
                      onPressed: () {
                        // FutureBuilder<mobileLoginResponse>(
                        //   future: futureLogin,
                        //   builder: (context, snapshot) {
                        //     if (snapshot.hasData) {
                        //       String response = snapshot.data.jwt;
                        //       storage.setItem("jwtResponse", response);
                        //       print(
                        //         storage.getItem("jwtResponse"),
                        //       );
                        //     }
                        //   },
                        // );
                        storage.setItem("otp", text);
                        print("the otp is" + storage.getItem("otp"));
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => VerifyOtpPage()

                              // Forms(),

                              //  FormPage()
                              ),
                        );
                      },
                      color: Color(0xFF01dcdc),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14))),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
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
                  ),
                  NumericKeyboard(
                    onKeyboardTap: _onKeyboardTap,
                    textColor: Color(0xFF01dcdc),
                    rightIcon: Icon(
                      Icons.backspace,
                      color: Color(0xFF01dcdc),
                    ),
                    rightButtonFn: () {
                      setState(() {
                        text = text.substring(0, text.length - 1);
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
