// ignore_for_file: avoid_print

import 'package:jwt_decoder/jwt_decoder.dart';

class CheckToken {
  CheckToken._();

  static final CheckToken instance = CheckToken._();

  getExpirationDate(String token) {
    DateTime expirationDate = JwtDecoder.getExpirationDate(token);
    print(expirationDate);
  }

  isExpired(String token) {
    bool isTokenExpired = JwtDecoder.isExpired(token);
    print(isTokenExpired);
  }
}
