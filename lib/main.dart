import 'package:cyn/screens/financeScreen.dart';
import 'package:cyn/screens/formPage.dart';
import 'package:cyn/screens/otpScreen.dart';
import 'package:cyn/screens/successfullPage.dart';
import 'package:cyn/screens/user_info_screen.dart';
import 'package:flutter/material.dart';

import 'screens/sign_in_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cynapse',
      debugShowCheckedModeBanner: false,
      color: Color(0xFF01dcdc),
      home:
          // OtpPage()
          SignInScreen(),
      // FinanceScreen()
    );
  }
}
