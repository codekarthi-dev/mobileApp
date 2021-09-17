import 'package:cyn/api/model/auth.dart';
import 'package:cyn/api/model/otp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Otp> fetchOtp(String authId, String aadharNo) async {
  var url =
      'https://preproduction.signzy.tech/api/v2/patrons/60d2cd4a463427755344b42c/digilockers';

  Map data = {
    'task': 'generateOtp',
    'essentials': {"uid": aadharNo}
  };
  var body = json.encode(data);

  var response = await http.post(Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        'Authorization': authId,
      },
      body: body);

  if (response.statusCode == 200) {
    print("${response.body}");

    return Otp.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load otp');
  }
}
