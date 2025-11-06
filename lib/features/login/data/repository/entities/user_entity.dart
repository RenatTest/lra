import 'package:lra/features/login/data/data_source/models/user_dto/user_dto.dart';

class UserEntity {
  const UserEntity(this.email, this.token);

  factory UserEntity.fromDTO(UserDto dto) {
    return UserEntity(dto.email, dto.access);
  }
  final String? email;
  final String? token;
}
