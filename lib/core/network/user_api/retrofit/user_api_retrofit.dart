import 'package:dio/dio.dart';
import 'package:lra/core/network/user_api/user_api_base.dart';
import 'package:lra/features/login/data/data_source/models/user_dto/user_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api_retrofit.g.dart';

@RestApi(baseUrl: 'https://gen-admin-dev.freegen.games')
abstract class UserApiRetrofit implements UserApiBase {
  factory UserApiRetrofit(Dio dio, {String? baseUrl}) = _UserApiRetrofit;

  @override
  @POST('/api/user/login')
  Future<UserDto> logIn({
    required String email,
    required String password,
    required String registrationType,
  });

  @override
  @POST('/api/user/register')
  Future<UserDto> register({
    required String email,
    required String password,
    required String registrationType,
  });
}
