// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppStateImpl _$$AppStateImplFromJson(Map<String, dynamic> json) =>
    _$AppStateImpl(
      authState: json['authState'] == null
          ? null
          : AuthState.fromJson(json['authState'] as Map<String, dynamic>),
      userState: json['userState'] == null
          ? null
          : UserState.fromJson(json['userState'] as Map<String, dynamic>),
      bottomNavState: json['bottomNavState'] == null
          ? null
          : BottomNavState.fromJson(
              json['bottomNavState'] as Map<String, dynamic>),
      onboardingState: json['onboardingState'] == null
          ? null
          : OnboardingState.fromJson(
              json['onboardingState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppStateImplToJson(_$AppStateImpl instance) =>
    <String, dynamic>{
      'authState': instance.authState?.toJson(),
      'userState': instance.userState?.toJson(),
      'bottomNavState': instance.bottomNavState?.toJson(),
      'onboardingState': instance.onboardingState?.toJson(),
    };
