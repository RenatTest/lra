import 'package:lra/core/network/user_api/user_api_base.dart';
import 'package:lra/features/login/data/data_source/models/user_dto/user_dto.dart';

abstract interface class UserDataSource {
  Future<UserDto> logIn({
    required String email,
    required String password,
    required String registrationType,
  });

  Future<UserDto> register({
    required String email,
    required String password,
    required String registrationType,
  });
}

class UserDataSourceImpl implements UserDataSource {
  UserDataSourceImpl(this._api);

  final UserApiBase _api;

  @override
  Future<UserDto> logIn({
    required String email,
    required String password,
    required String registrationType,
  }) async {
    final result = await _api.logIn(
      email: email,
      password: password,
      registrationType: registrationType,
    );

    return result;
  }

  @override
  Future<UserDto> register({
    required String email,
    required String password,
    required String registrationType,
  }) async {
    final result = await _api.register(
      email: email,
      password: password,
      registrationType: registrationType,
    );

    return result;
  }
}
