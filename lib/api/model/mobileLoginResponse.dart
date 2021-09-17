class MobileLoginResponse {
  String message;
  String jwt;
  String email;
  int expireAt;

  MobileLoginResponse({this.message, this.jwt, this.email, this.expireAt});

  factory MobileLoginResponse.fromJson(Map<String, dynamic> json) {
    return MobileLoginResponse(
        message: json['message'],
        jwt: json['jwt'],
        email: json['email'],
        expireAt: json['expireAt']);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['message'] = this.message;
  //   data['jwt'] = this.jwt;
  //   data['email'] = this.email;
  //   data['expireAt'] = this.expireAt;
  //   return data;
  // }
}
