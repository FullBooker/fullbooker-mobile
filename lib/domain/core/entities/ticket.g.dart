// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketImpl _$$TicketImplFromJson(Map<String, dynamic> json) => _$TicketImpl(
      id: json['id'] as String? ?? UNKNOWN,
      createdAt: json['created_at'] as String? ?? UNKNOWN,
      updatedAt: json['updated_at'] as String? ?? UNKNOWN,
      active: json['active'] as bool? ?? false,
      host: json['host'] as String? ?? UNKNOWN,
      number: json['number'] as String? ?? UNKNOWN,
      url: json['url'] as String? ?? UNKNOWN,
      name: json['name'] as String? ?? UNKNOWN,
      idNumber: json['id_number'] as String? ?? UNKNOWN,
      phoneNumber: json['phone_number'] as String? ?? UNKNOWN,
      email: json['email'] as String? ?? UNKNOWN,
      start: json['start'] as String? ?? UNKNOWN,
      end: json['end'] as String? ?? UNKNOWN,
      booking: json['booking'] as String? ?? UNKNOWN,
      pricing: json['pricing'] as String? ?? UNKNOWN,
      qrCode: json['qr_code'] as String? ?? UNKNOWN,
      pricingDetails: json['pricing_details'] == null
          ? null
          : ProductPricing.fromJson(
              json['pricing_details'] as Map<String, dynamic>),
      currencyCode: json['currency_code'] as String? ?? UNKNOWN,
      isValid: json['is_valid'] as bool? ?? false,
      productName: json['product_name'] as String? ?? UNKNOWN,
    );

Map<String, dynamic> _$$TicketImplToJson(_$TicketImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'host': instance.host,
      'number': instance.number,
      'url': instance.url,
      'name': instance.name,
      'id_number': instance.idNumber,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'start': instance.start,
      'end': instance.end,
      'booking': instance.booking,
      'pricing': instance.pricing,
      'qr_code': instance.qrCode,
      'pricing_details': instance.pricingDetails?.toJson(),
      'currency_code': instance.currencyCode,
      'is_valid': instance.isValid,
      'product_name': instance.productName,
    };
