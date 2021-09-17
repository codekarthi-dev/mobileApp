// @dart=2.12

// import 'dart:html';

import 'package:cyn/api/api_config.dart';
import 'package:cyn/api/authApi.dart';
import 'package:cyn/api/mobileLogin.dart';
import 'package:cyn/api/model/auth.dart';
import 'package:cyn/api/model/data.dart';
import 'package:cyn/api/model/mobileLoginResponse.dart';
import 'package:cyn/screens/aadharPage.dart';
import 'package:cyn/widgets/constants.dart';
import 'package:cyn/widgets/switcher.dart';
import 'package:cyn/widgets/expensePageView.dart';
import 'package:localstorage/localstorage.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cyn/res/custom_colors.dart';
import 'package:cyn/screens/sign_in_screen.dart';
import 'package:cyn/utils/authentication.dart';
import 'package:cyn/widgets/app_bar_title.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cyn/widgets/section/slimeBox.dart';
import 'package:drawer_swipe/drawer_swipe.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
// import 'package:cyn/screens/apply.dart';
import 'package:cyn/screens/formPage.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  final LocalStorage storage = new LocalStorage('localstorage_app');
  int _graphIndex = 0;

  bool _isSigningOut = false;
  late Future<Auths> futureAuth;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  var drawerKey = GlobalKey<SwipeDrawerState>();

  late User _user;
  Future<Datas>? futureDatas;
  Future<Auths>? futureAuths;
  Future<MobileLoginResponse>? futureLogin;

  // bool _isSigningOut = false;

  @override
  void initState() {
    _user = widget._user;
    String id = '${_user.email!}';
    storage.setItem("googleEmail", id);

    super.initState();
    futureAuths = fetchAuths();

    futureDatas = fetchData(id);
    futureLogin = fetchMobileLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar  Body
      extendBodyBehindAppBar: true,
      body: SwipeDrawer(
        radius: 20,
        key: drawerKey,

        hasClone: false,
        bodyBackgroundPeekSize: 30,
        backgroundColor: Color(0xFF01dcdc),

        //  drawer widget
        drawer: buildDrawer(),
        //  body widget
        child: buildBody(),
      ),
    );
  }

  Widget buildDrawer() {
    return Container(
      margin: EdgeInsets.only(top: 150),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 50, left: 8, right: 8, bottom: 8),
            child: Row(
              children: [
                ClipOval(
                  child: Material(
                    color: CustomColors.firebaseGrey.withOpacity(0.3),
                    child: Image.network(
                      _user.photoURL!,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: _user.displayName!,
                        style: GoogleFonts.inter(
                            color: Colors.white70,
                            fontSize: 20,
                            fontWeight: FontWeight.w700))
                  ]),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.pages),
            title: Text(
              'APPLY',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AadharPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment_ind_outlined),
            title: Text(
              'MY PLAN',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => Apply(
              //             user: _user,
              //           )));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'SETTINGS',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => Apply(
              //             user: _user,
              //           )));
            },
          ),
          SizedBox(
            height: 200,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.redAccent,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningOut = true;
                });
                storage.clear();

                await Authentication.signOut(context: context);
                setState(() {
                  _isSigningOut = false;
                });
                Navigator.of(context).pushReplacement(_routeToSignInScreen());
              },
              child: Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        // appBar
        AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            'CYNAPSE',
            style: TextStyle(color: Color(0xFF01dcdc), fontSize: 30),
          ),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: ImageIcon(
                AssetImage("assets/logo/menu.png"),
                size: 40,
                color: Color(0xFF01dcdc),
              ),
              onPressed: () {
                if (drawerKey.currentState!.isOpened()) {
                  drawerKey.currentState!.closeDrawer();
                } else {
                  drawerKey.currentState!.openDrawer();
                }
              },
            );
          }),
        ),
        SizedBox(
          height: 1,
        ),

        Expanded(
            child: ListView(
          children: [
            Container(
              // height: 900,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // graphpo
                  Positioned(
                    top: 90,
                    child: Container(
                      height: 500,
                      child: ExpensePageView(
                        graphIndex: _graphIndex,
                      ),
                    ),
                  ),
                  // bottom sheet
                  Container(
                    width: double.infinity,
                    height: 189.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 18.0,
                        ),
                        Switcher(
                          whichGraph: (int graphIndex) {
                            setState(() {
                              _graphIndex = graphIndex;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // child: ListView(
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(top: 0, left: 16),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //       ),
              //     ),
              //     FutureBuilder<Auths>(
              //       future: futureAuths,
              //       builder: (context, snapshot) {
              //         if (snapshot.hasData) {
              //           storage.setItem("authId", "${snapshot.data!.id}");

              //           return Container(
              //             height: 30,
              //             width: 60,
              //           );
              //         } else if (snapshot.hasError) {
              //           return Text("${snapshot.error}");
              //         }
              //         return Shimmer.fromColors(
              //             child: Container(
              //               height: 10,
              //             ),
              //             baseColor: Colors.white,
              //             highlightColor: Colors.white);
              //       },
              //     ),
              //     FutureBuilder<Datas>(
              //       future: futureDatas,
              //       builder: (context, snapshot) {
              //         if (snapshot.hasData) {
              //           return card(
              //               availedAmount: snapshot.data!.availedLoanAmount!,
              //               sanctionedAmount:
              //                   snapshot.data!.sanctionedLoanAmount);
              //         } else if (snapshot.hasError) {
              //           return Text("${snapshot.error}");
              //         }
              //         return SizedBox(
              //           width: 200.0,
              //           height: 100.0,
              //           child: Shimmer.fromColors(
              //             baseColor: Colors.blue,
              //             highlightColor: Color(0xFF01dcdc),
              //             child: Text(
              //               'Cynapse .',
              //               textAlign: TextAlign.center,
              //               style: TextStyle(
              //                 fontSize: 60.0,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ],
              // ),
            )
          ],
        )),
      ],
    );
  }
}
