// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketTypeResponseImpl _$$TicketTypeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TicketTypeResponseImpl(
      count: (json['count'] as num?)?.toInt() ?? 0,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : TicketType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TicketTypeResponseImplToJson(
        _$TicketTypeResponseImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results?.map((e) => e?.toJson()).toList(),
    };
