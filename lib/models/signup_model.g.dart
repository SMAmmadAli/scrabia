// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupModel _$SignupModelFromJson(Map<String, dynamic> json) => SignupModel(
      payload: json['payload'] == null
          ? null
          : Payload.fromJson(json['payload'] as Map<String, dynamic>),
      msg: json['msg'] as String?,
      success: json['success'] as bool?,
      requestTime: json['requestTime'] as String?,
    );

Map<String, dynamic> _$SignupModelToJson(SignupModel instance) =>
    <String, dynamic>{
      'payload': instance.payload?.toJson(),
      'msg': instance.msg,
      'success': instance.success,
      'requestTime': instance.requestTime,
    };

Payload _$PayloadFromJson(Map<String, dynamic> json) => Payload(
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'data': instance.data?.toJson(),
      'msg': instance.msg,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['id'] as String?,
      status: json['status'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      position: json['position'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      contactNumber: json['contactNumber'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'position': instance.position,
      'email': instance.email,
      'password': instance.password,
      'contactNumber': instance.contactNumber,
      'userId': instance.userId,
    };
