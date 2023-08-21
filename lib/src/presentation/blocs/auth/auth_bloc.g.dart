// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthenticationState _$$_AuthenticationStateFromJson(
        Map<String, dynamic> json) =>
    _$_AuthenticationState(
      status:
          $enumDecodeNullable(_$AuthenticationStatusEnumMap, json['status']) ??
              AuthenticationStatus.unknown,
      statusPage: $enumDecodeNullable(_$PageReadyEnumMap, json['statusPage']) ??
          PageReady.notReady,
      loginUser: json['loginUser'] as String?,
      userModel: json['userModel'] as String?,
      daftarArea: (json['daftarArea'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      daftarAreaID: (json['daftarAreaID'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$_AuthenticationStateToJson(
        _$_AuthenticationState instance) =>
    <String, dynamic>{
      'status': _$AuthenticationStatusEnumMap[instance.status]!,
      'statusPage': _$PageReadyEnumMap[instance.statusPage]!,
      'loginUser': instance.loginUser,
      'userModel': instance.userModel,
      'daftarArea': instance.daftarArea,
      'daftarAreaID': instance.daftarAreaID,
      'userId': instance.userId,
    };

const _$AuthenticationStatusEnumMap = {
  AuthenticationStatus.unknown: 'unknown',
  AuthenticationStatus.authenticated: 'authenticated',
  AuthenticationStatus.unauthenticated: 'unauthenticated',
  AuthenticationStatus.me: 'me',
  AuthenticationStatus.verification: 'verification',
};

const _$PageReadyEnumMap = {
  PageReady.notReady: 'notReady',
  PageReady.ready: 'ready',
};
