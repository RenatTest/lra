// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:lra/core/network/user_api/retrofit/user_api_retrofit.dart';
import 'package:lra/core/storage/prefs_storage/prefs_storage.dart';
import 'package:lra/core/storage/secure_storage/secure_storage.dart';
import 'package:lra/core/token/check_token.dart';
import 'package:lra/features/login/data/data_source/user_data_source.dart';
import 'package:lra/features/login/data/repository/user_repository.dart';
import 'package:lra/features/login/presentation/cubit/auth_cubit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

void initDI() {
  _registerAuth();
}

void _registerAuth() {
  final Dio dio = Dio()
    ..interceptors.add(PrettyDioLogger(enabled: kDebugMode))
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          print('Request: ${options.uri}');
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          print('Response: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          print('Error: ${error.response?.data}');
          return handler.next(error);
        },
      ),
    );

  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      authRepository: UserRepositoryImpl(
        dataSource: UserDataSourceImpl(UserApiRetrofit(dio)),
      ),
      secureStorage: SecureStorage.instance,
      prefs: PrefsStorage.instance,
      checkToken: CheckToken.instance,
    ),
  );
}
