import 'package:cyn/api/model/FetchFile.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<FetchFile> fetchFileFromOtp(String requestId, String authId) async {
  var url =
      'https://preproduction.signzy.tech/api/v2/patrons/60d2cd4a463427755344b42c/digilockers';

  Map data = {
    'task': 'fetchFiles',
    'essentials': {
      "requestId": requestId,
      "docType": ["SSCER", "HSCER", "PANCR", "DRVLC", "ADHAR"]
    }
  };
  var body = json.encode(data);

  var response = await http.post(Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        'Authorization': authId,
      },
      body: body);

  if (response.statusCode == 200) {
    print("the body is here" + body);
    print("${response.body}");

    return FetchFile.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to fetch files');
  }
}
