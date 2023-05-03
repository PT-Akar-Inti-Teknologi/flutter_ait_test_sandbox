// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_local_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthLocalModel _$$_AuthLocalModelFromJson(Map<String, dynamic> json) =>
    _$_AuthLocalModel(
      authToken: json['auth_token'] == null
          ? null
          : TokenModel.fromJson(json['auth_token'] as Map<String, dynamic>),
      guestToken: json['guest_token'] == null
          ? null
          : TokenModel.fromJson(json['guest_token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AuthLocalModelToJson(_$_AuthLocalModel instance) =>
    <String, dynamic>{
      'auth_token': instance.authToken?.toJson(),
      'guest_token': instance.guestToken?.toJson(),
    };
