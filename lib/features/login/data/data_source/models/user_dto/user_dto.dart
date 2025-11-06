import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  int? id;
  String? access;
  String? refresh;
  dynamic userId;
  dynamic firstName;
  dynamic lastName;
  dynamic fullName;
  dynamic username;
  dynamic email;
  dynamic clearEmail;
  dynamic phone;
  dynamic country;
  dynamic city;
  dynamic birthDate;
  dynamic gender;
  dynamic profileImageUrl;
  dynamic joinDate;
  dynamic lastLoginDate;
  dynamic lastLoginDateDisplay;
  String? role;
  dynamic password;
  dynamic newPassword;
  dynamic status;
  dynamic isQuestionnaireFilled;
  String? registrationType;
  List<String>? authorities;
  bool? userIsActive;
  bool? userIsNotLocked;
  dynamic notifications;
  dynamic timer;
  dynamic accounts;
  dynamic active;
  dynamic playMusic;

  UserDto({
    this.id,
    this.access,
    this.refresh,
    this.userId,
    this.firstName,
    this.lastName,
    this.fullName,
    this.username,
    this.email,
    this.clearEmail,
    this.phone,
    this.country,
    this.city,
    this.birthDate,
    this.gender,
    this.profileImageUrl,
    this.joinDate,
    this.lastLoginDate,
    this.lastLoginDateDisplay,
    this.role,
    this.password,
    this.newPassword,
    this.status,
    this.isQuestionnaireFilled,
    this.registrationType,
    this.authorities,
    this.userIsActive,
    this.userIsNotLocked,
    this.notifications,
    this.timer,
    this.accounts,
    this.active,
    this.playMusic,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
