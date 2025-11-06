import 'package:lra/features/login/data/data_source/models/user_dto/user_dto.dart';

abstract interface class UserApiBase {
  Future<UserDto> logIn({
    required String email,
    required String password,
    required String registrationType,
  });
  Future<UserDto> register({
    required String email,
    required String password,
    required String username,
    required String registrationType,
  });
}
