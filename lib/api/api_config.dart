import 'package:cyn/api/model/data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Datas> fetchData(String id) async {
  String emailId = id;

  final response = await http.get(Uri.parse(
      'https://service.cynapse.co.in/backendApi/api/email_read.php?email_id=' +
          emailId));

  // Appropriate action depending upon the
  // server response
  if (response.statusCode == 200) {
    return Datas.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
