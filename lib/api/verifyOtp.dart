import 'package:cyn/api/model/auth.dart';
import 'package:cyn/api/model/otp.dart';
import 'package:cyn/api/model/otpResult.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<OtpResult> verifyOtp(
    String requestId, String otpNo, String authId) async {
  var url =
      'https://preproduction.signzy.tech/api/v2/patrons/60d2cd4a463427755344b42c/digilockers';

  Map data = {
    'task': 'verifyOtp',
    'essentials': {"requestId": requestId, "otp": otpNo}
  };
  var body = json.encode(data);

  var response = await http.post(Uri.parse(url),
      headers: {
        "Content-Type": "application/json;charset=UTF-8",
        'Authorization': authId,
      },
      body: body);
  // var list = response as List;

  if (response.statusCode == 200) {
    print("${response.body}");

    return OtpResult.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load response');
  }
}
