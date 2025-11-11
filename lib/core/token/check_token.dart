// ignore_for_file: avoid_print

import 'package:jwt_decoder/jwt_decoder.dart';

class CheckToken {
  CheckToken._();

  static final CheckToken instance = CheckToken._();

  DateTime getExpirationDate(String? token) {
    DateTime expirationDate = token == null
        ? DateTime.now()
        : JwtDecoder.getExpirationDate(token);
    print(expirationDate);
    return expirationDate;
  }

  bool isExpired(String? token) {
    bool isTokenExpired = token == null ? true : JwtDecoder.isExpired(token);
    print(isTokenExpired);
    return isTokenExpired;
  }
}
