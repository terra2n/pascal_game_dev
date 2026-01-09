import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.g.dart'; // File ini akan digenerate otomatis

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.username,
    super.token,
  });

  // Dari JSON ke Dart Object
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // Dari Dart Object ke JSON
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
