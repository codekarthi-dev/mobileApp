class Otp {
  Result result;

  Otp({this.result});

  Otp.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  String requestId;

  Result({this.requestId});

  Result.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requestId'] = this.requestId;
    return data;
  }
}
