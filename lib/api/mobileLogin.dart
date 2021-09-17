import 'package:cyn/api/model/mobileLoginResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<MobileLoginResponse> fetchMobileLogin() async {
  var url = 'https://service.cynapse.co.in/mobile_backend/api/login.php';

  Map data = {
    'email': 'karthik@cynapse.co.in',
    'password': '2021CynapseMobile'
  };

  var body = json.encode(data);

  var response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"}, body: body);

  if (response.statusCode == 200) {
    print("${response.body}");

    return MobileLoginResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load otp');
  }
}
