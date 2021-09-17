// @dart=2.12

// import 'dart:js';
import 'dart:convert';
import 'package:cyn/utils/authentication.dart';
import 'package:cyn/widgets/forms.dart';

import 'package:flutter/material.dart';
import 'package:drawer_swipe/drawer_swipe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'user_info_screen.dart';
import 'package:cyn/screens/sign_in_screen.dart';
import 'package:cyn/screens/user_info_screen.dart';

import 'user_info_screen.dart';

// class Details {
//   final String? aadharNumber;

//   const Details({
//     this.aadharNumber,
//   });
// }

class FormPage extends StatefulWidget {
  String? aadhar;

  FormPage({Key? key, required User user, this.aadhar});
  // : _user = user,
  // super(key: key);

  // final User _user;

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  bool _isSigningOut = false;

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
  // Future<Datas>? futureDatas;
  // bool _isSigningOut = false;

  void initState() {
    // _user = widget._user;
    // String id = '${widget.value.}';

    super.initState();
    // futureDatas = fetchData(id);
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
    bool _isSigningOut = false;

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
                      // color: CustomColors.firebaseGrey.withOpacity(0.3),
                      // child: Image.network(
                      //   _user.photoURL!,
                      //   fit: BoxFit.fitHeight,
                      // ),
                      ),
                ),
                SizedBox(
                  width: 8,
                ),
                RichText(
                  text: TextSpan(children: [
                    // TextSpan(
                    //     text: _user.displayName!,
                    //     style: GoogleFonts.inter(
                    //         color: Colors.white70,
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.w700))
                  ]),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'HOME',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInfoScreen(
                        user: _user,
                      )));
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment_ind_outlined),
            title: Text(
              'MY PLAN',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInfoScreen(
                        user: _user,
                      )));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'SETTINGS',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInfoScreen(
                        user: _user,
                      )));
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
            'Apply',
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
          height: 18,
        ),

        Expanded(
          child: SingleChildScrollView(
            child: Forms(),
          ),
        ),
      ],
    );
  }
}
