import 'package:cyn/api/model/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Auths> fetchAuths() async {
  var url = 'https://preproduction.signzy.tech/api/v2/patrons/login';

  Map data = {'username': 'cynapse_test', 'password': 'NjEf2SDFVUZW6DykNZaJ'};
  var body = json.encode(data);

  var response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"}, body: body);

  if (response.statusCode == 200) {
    print("${response.body}");

    return Auths.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
