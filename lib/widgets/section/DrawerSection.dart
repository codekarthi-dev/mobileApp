import 'package:cyn/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:cyn/screens/sign_in_screen.dart';

class DrawerSection extends StatefulWidget {
  @override
  _DrawerSectionState createState() => _DrawerSectionState();
}

class _DrawerSectionState extends State<DrawerSection> {
  static const IconData logout = IconData(0xe3b3, fontFamily: 'MaterialIcons');

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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: OutlineButton.icon(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(26)),
            highlightElevation: 40,
            borderSide:
                BorderSide(color: Color(0xFF01dcdc), style: BorderStyle.solid),
            color: Color(0xFF01dcdc),
            textColor: Color(0xFF01dcdc),
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
            icon: Icon(
              logout,
              color: Color(0xFF01dcdc),
            ),
            label: Text("Sign Out"),
          )
          // ElevatedButton(
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(
          //       Color(0xFF01dcdc),
          //     ),
          //     shape: MaterialStateProperty.all(
          //       RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //     ),
          //   ),
          //   onPressed: () async {
          //     setState(() {
          //       _isSigningOut = true;
          //     });
          //     await Authentication.signOut(context: context);
          //     setState(() {
          //       _isSigningOut = false;
          //     });
          //     Navigator.of(context).pushReplacement(_routeToSignInScreen());
          //   },
          //   child: Padding(
          //     padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          //     child: Text(
          //       'Sign Out',
          //       style: TextStyle(
          //         fontSize: 20,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white,
          //         letterSpacing: 2,
          //       ),
          //     ),
          //   ),
          // ),

          ),
    );
  }
}
