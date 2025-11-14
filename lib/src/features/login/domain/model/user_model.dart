import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final String? uid;
  final String? email;
  final String? name;
  final String? profile;
  final String? description;
  final List<String>? followers;
  final List<String>? followings;

  const UserModel({
    required this.uid,
    required this.email,
    required this.name,
    this.profile,
    this.description,
    this.followers,
    this.followings,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? profile,
    String? description,
    List<String>? followers,
    List<String>? followings,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      profile: profile ?? this.profile,
      description: description ?? this.description,
      followers: followers ?? this.followers,
      followings: followings ?? this.followings,
    );
  }

  @override
  List<Object?> get props => [
    uid,
    email,
    name,
    profile,
    description,
    followers,
    followings,
  ];

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toMap() => _$UserModelToJson(this);
}
