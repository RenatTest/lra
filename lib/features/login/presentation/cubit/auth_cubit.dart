import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lra/core/storage/prefs_storage/prefs_storage.dart';
import 'package:lra/core/storage/secure_storage/secure_storage.dart';
import 'package:lra/core/token/check_token.dart';
import 'package:lra/features/login/data/repository/entities/user_entity.dart';
import 'package:lra/features/login/data/repository/user_repository.dart';
import 'package:lra/features/login/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.authRepository,
    required this.secureStorage,
    required this.prefs,
    required this.checkToken,
  }) : super(AuthState()) {
    _init();
  }

  final UserRepository authRepository;
  final SecureStorage secureStorage;
  final PrefsStorage prefs;
  final CheckToken checkToken;

  Future<void> _init() async {
    final token = await secureStorage.getToken();
    final userId = await prefs.getUserId();

    if (token != '' && userId != 0) {
      final user = UserEntity(userId, token);
      checkToken.getExpirationDate(token);
      bool isTokenExpired = checkToken.isExpired(token);
      if (isTokenExpired) logOut();
      emit(state.copyWith(user: user));
    }
  }

  Future<void> logIn(
    String email,
    String password,
    String registrationType,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      final user = await authRepository.logIn(
        email: email,
        password: password,
        registrationType: registrationType,
      );

      checkToken.getExpirationDate(user.token);
      checkToken.isExpired(user.token);
      await secureStorage.saveToken(user.token);
      await prefs.saveUserId(user.id);

      emit(state.copyWith(loading: false, user: user));
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        emit(
          state.copyWith(
            loading: false,
            error: 'Login / Password entered incorrectly. Please try again',
          ),
        );
      } else {
        emit(
          state.copyWith(
            loading: false,
            error: 'Server error. Please try again later',
          ),
        );
      }
    }
  }

  Future<void> register(
    String email,
    String password,
    String username,
    String registrationType,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      final user = await authRepository.register(
        email: email,
        password: password,
        username: username,
        registrationType: registrationType,
      );

      checkToken.getExpirationDate(user.token);
      checkToken.isExpired(user.token);
      await secureStorage.saveToken(user.token);
      await prefs.saveUserId(user.id);

      emit(state.copyWith(loading: false, user: user));
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        emit(state.copyWith(loading: false, error: 'Email already exists'));
      } else {
        emit(
          state.copyWith(
            loading: false,
            error: 'Server error. Please try again later',
          ),
        );
      }
    }
  }

  Future<void> logOut() async {
    await secureStorage.deleteToken();
    await prefs.deleteUserId();
    emit(AuthState());
  }
}
