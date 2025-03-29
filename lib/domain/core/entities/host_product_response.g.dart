// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HostProductResponseImpl _$$HostProductResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$HostProductResponseImpl(
      count: (json['count'] as num?)?.toInt() ?? 0,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => HostProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HostProductResponseImplToJson(
        _$HostProductResponseImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

_$HostProductImpl _$$HostProductImplFromJson(Map<String, dynamic> json) =>
    _$HostProductImpl(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      active: json['active'] as bool,
      host: UserState.fromJson(json['host'] as Map<String, dynamic>),
      name: json['name'] as String,
      description: json['description'] as String,
      number: json['number'] as String,
      category: json['category'] as String,
      subcategory: json['subcategory'] as String,
      availability:
          Availability.fromJson(json['availability'] as Map<String, dynamic>),
      pricing: (json['pricing'] as List<dynamic>)
          .map((e) => Pricing.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] == null
          ? null
          : MediaFile.fromJson(json['image'] as Map<String, dynamic>),
      video: json['video'],
      locations: (json['locations'] as List<dynamic>)
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HostProductImplToJson(_$HostProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'host': instance.host.toJson(),
      'name': instance.name,
      'description': instance.description,
      'number': instance.number,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'availability': instance.availability.toJson(),
      'pricing': instance.pricing.map((e) => e.toJson()).toList(),
      'image': instance.image?.toJson(),
      'video': instance.video,
      'locations': instance.locations.map((e) => e.toJson()).toList(),
    };

_$AvailabilityImpl _$$AvailabilityImplFromJson(Map<String, dynamic> json) =>
    _$AvailabilityImpl(
      id: json['id'] as String,
      product: json['product'] as String,
      productName: json['product_name'] as String,
      start: json['start'] as String,
      end: json['end'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      duration: json['duration'] as String?,
      openDays: json['open_days'] as List<dynamic>? ?? const <dynamic>[],
      closedDates: json['closed_dates'] as List<dynamic>? ?? const <dynamic>[],
    );

Map<String, dynamic> _$$AvailabilityImplToJson(_$AvailabilityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'product_name': instance.productName,
      'start': instance.start,
      'end': instance.end,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'duration': instance.duration,
      'open_days': instance.openDays,
      'closed_dates': instance.closedDates,
    };

_$PricingImpl _$$PricingImplFromJson(Map<String, dynamic> json) =>
    _$PricingImpl(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      active: json['active'] as bool,
      host: json['host'] as String,
      name: json['name'] as String?,
      product: json['product'] as String,
      currency: json['currency'] as String,
      cost: json['cost'] as String,
      type: json['type'] as String,
      ticketTier: json['ticket_tier'] as String,
      maxTickets: (json['maximum_number_of_tickets'] as num).toInt(),
      remainingTickets: (json['remaining_tickets'] as num).toInt(),
      soldTickets: (json['sold_tickets'] as num).toInt(),
    );

Map<String, dynamic> _$$PricingImplToJson(_$PricingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'host': instance.host,
      'name': instance.name,
      'product': instance.product,
      'currency': instance.currency,
      'cost': instance.cost,
      'type': instance.type,
      'ticket_tier': instance.ticketTier,
      'maximum_number_of_tickets': instance.maxTickets,
      'remaining_tickets': instance.remainingTickets,
      'sold_tickets': instance.soldTickets,
    };

_$MediaFileImpl _$$MediaFileImplFromJson(Map<String, dynamic> json) =>
    _$MediaFileImpl(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      active: json['active'] as bool,
      host: json['host'] as String,
      mediaType: json['media_type'] as String,
      file: json['file'] as String,
      uploadedAt: json['uploaded_at'] as String,
    );

Map<String, dynamic> _$$MediaFileImplToJson(_$MediaFileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'host': instance.host,
      'media_type': instance.mediaType,
      'file': instance.file,
      'uploaded_at': instance.uploadedAt,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      active: json['active'] as bool,
      host: json['host'] as String,
      product: json['product'] as String,
      coordinates: json['coordinates'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active': instance.active,
      'host': instance.host,
      'product': instance.product,
      'coordinates': instance.coordinates,
      'address': instance.address,
    };
