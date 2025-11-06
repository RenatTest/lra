import 'package:lra/features/login/data/data_source/models/user_dto/user_dto.dart';

class UserEntity {
  const UserEntity(this.id, this.token);

  factory UserEntity.fromDTO(UserDto dto) {
    return UserEntity(dto.id, dto.access);
  }
  final int? id;
  final String? token;
}
