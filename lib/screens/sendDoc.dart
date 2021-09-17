// import 'package:cyn/api/fileFetch.dart';
// import 'package:cyn/api/model/FetchFile.dart';
// import 'package:flutter/material.dart';
// import 'package:localstorage/localstorage.dart';

// class sendDoc extends StatefulWidget {
//   @override
//   _sendDocState createState() => _sendDocState();
// }

// class _sendDocState extends State<sendDoc> {
//   final LocalStorage storage = new LocalStorage('localstorage_app');

//   Future<FetchFile> futureSuccesfullPage;

//   @override
//   void initState() {
//     String requestId = storage.getItem("requestId");
//     // String otpNo = storage.getItem("otp");
//     String authId = storage.getItem("authId");
//     String panCode;
//     String drvCode;

//     futureSuccesfullPage = fetchFile(authId, requestId, panCode, drvCode);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
