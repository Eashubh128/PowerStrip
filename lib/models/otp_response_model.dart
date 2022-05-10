import 'dart:convert';

OtpLoginResponse? otpLoginResponsejson(String str) {
  var x = OtpLoginResponse.fromjson(json.decode(str));
  return x;
}

class OtpLoginResponse {
  OtpLoginResponse({required this.message, required this.status});

  late final String message;
  late final String? status;

  OtpLoginResponse.fromjson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }
}
