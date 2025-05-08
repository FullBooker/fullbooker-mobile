// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_booking_tickets_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductBookingTicketsResponseImpl
    _$$ProductBookingTicketsResponseImplFromJson(Map<String, dynamic> json) =>
        _$ProductBookingTicketsResponseImpl(
          count: (json['count'] as num?)?.toInt() ?? 0,
          next: json['next'] as String?,
          previous: json['previous'] as String?,
          results: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  e == null ? null : Ticket.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$ProductBookingTicketsResponseImplToJson(
        _$ProductBookingTicketsResponseImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results?.map((e) => e?.toJson()).toList(),
    };
