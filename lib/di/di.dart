import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lra/core/network/user_api/retrofit/user_api_retrofit.dart';
import 'package:lra/core/storage/prefs_storage/prefs_storage.dart';
import 'package:lra/core/storage/secure_storage/secure_storage.dart';
import 'package:lra/features/login/data/data_source/user_data_source.dart';
import 'package:lra/features/login/data/repository/user_repository.dart';
import 'package:lra/features/login/presentation/cubit/auth_cubit.dart';

final getIt = GetIt.instance;

void initDI() {
  _registerAuth();
}

void _registerAuth() {
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      authRepository: UserRepositoryImpl(
        dataSource: UserDataSourceImpl(UserApiRetrofit(Dio())),
      ),
      secureStorage: SecureStorage.instance,
      prefs: PrefsStorage.instance,
    ),
  );
}
