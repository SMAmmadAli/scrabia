import 'package:json_annotation/json_annotation.dart';

part 'signup_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SignupModel {
  final Payload? payload;
  final String? msg;
  final bool? success;
  final String? requestTime;

  SignupModel({
    this.payload,
    this.msg,
    this.success,
    this.requestTime,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) =>
      _$SignupModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignupModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Payload {
  final UserData? data;
  final String? msg;

  Payload({this.data, this.msg});

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);
  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}

@JsonSerializable()
class UserData {
  final String? id;
  final String? status;
  final String? firstName;
  final String? lastName;
  final String? position;
  final String? email;
  final String? password;
  final String? contactNumber;
  final String? userId;

  UserData({
    this.id,
    this.status,
    this.firstName,
    this.lastName,
    this.position,
    this.email,
    this.password,
    this.contactNumber,
    this.userId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
