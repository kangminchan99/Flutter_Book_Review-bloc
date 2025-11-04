import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final String? uid;
  final String? email;
  final String? name;
  final String? profile;

  const UserModel({
    required this.uid,
    required this.email,
    required this.name,
    this.profile,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? profile,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      profile: profile ?? this.profile,
    );
  }

  @override
  List<Object?> get props => [uid, email, name, profile];

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
