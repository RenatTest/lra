import 'package:lra/features/login/data/data_source/user_data_source.dart';
import 'package:lra/features/login/data/repository/entities/user_entity.dart';

abstract interface class UserRepository {
  Future<UserEntity> logIn({
    required String email,
    required String password,
    required String registrationType,
  });

  Future<UserEntity> register({
    required String email,
    required String password,
    required String username,
    required String registrationType,
  });
}

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.dataSource});

  final UserDataSource dataSource;

  @override
  Future<UserEntity> logIn({
    required String email,
    required String password,
    required String registrationType,
  }) async {
    final response = await dataSource.logIn(
      email: email,
      password: password,
      registrationType: registrationType,
    );

    final userData = UserEntity.fromDTO(response);

    return userData;
  }

  @override
  Future<UserEntity> register({
    required String email,
    required String password,
    required String username,
    required String registrationType,
  }) async {
    final response = await dataSource.register(
      email: email,
      password: password,
      username: username,
      registrationType: registrationType,
    );

    final userData = UserEntity.fromDTO(response);

    return userData;
  }
}
