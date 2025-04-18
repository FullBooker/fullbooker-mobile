// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyImpl _$$CurrencyImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyImpl(
      id: json['id'] as String? ?? UNKNOWN,
      createdAt: json['created_at'] as String? ?? UNKNOWN,
      updatedAt: json['updated_at'] as String? ?? UNKNOWN,
      active: json['active'] as bool? ?? false,
      name: json['name'] as String? ?? UNKNOWN,
      code: json['code'] as String? ?? UNKNOWN,
      conversionRate: json['conversion_rate'] as String,
    );

Map<String, dynamic> _$$CurrencyImplToJson(_$CurrencyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'name': instance.name,
      'code': instance.code,
      'conversion_rate': instance.conversionRate,
    };
