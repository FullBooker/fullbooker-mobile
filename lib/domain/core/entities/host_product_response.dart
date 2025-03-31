import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/application/redux/states/user_state.dart';

part 'host_product_response.freezed.dart';
part 'host_product_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class HostProductResponse with _$HostProductResponse {
  @JsonSerializable(explicitToJson: true)
  factory HostProductResponse({
    @Default(0) int count,
    String? next,
    String? previous,
    @JsonKey(name: 'results') List<HostProduct>? results,
  }) = _HostProductResponse;

  factory HostProductResponse.fromJson(Map<String, dynamic> json) =>
      _$HostProductResponseFromJson(json);
}

@freezed
class HostProduct with _$HostProduct {
  @JsonSerializable(explicitToJson: true)
  factory HostProduct({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required bool active,
    required UserState host,
    required String name,
    required String description,
    required String number,
    required String category,
    required String subcategory,
    required Availability availability,
    required List<Pricing> pricing,
    MediaFile? image,
    dynamic video,
    required List<Location> locations,
  }) = _HostProduct;

  factory HostProduct.fromJson(Map<String, dynamic> json) =>
      _$HostProductFromJson(json);
}

@freezed
class Availability with _$Availability {
  factory Availability({
    required String id,
    required String product,
    @JsonKey(name: 'product_name') required String productName,
    required String start,
    required String end,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    int? duration,
    @Default(<dynamic>[]) @JsonKey(name: 'open_days') List<dynamic> openDays,
    @Default(<dynamic>[])
    @JsonKey(name: 'closed_dates')
    List<dynamic> closedDates,
  }) = _Availability;

  factory Availability.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityFromJson(json);
}

@freezed
class Pricing with _$Pricing {
  @JsonSerializable(explicitToJson: true)
  factory Pricing({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required bool active,
    required String host,
    String? name,
    required String product,
    required String currency,
    required String cost,
    required String type,
    @JsonKey(name: 'ticket_tier') required String ticketTier,
    @JsonKey(name: 'maximum_number_of_tickets') required int maxTickets,
    @JsonKey(name: 'remaining_tickets') required int remainingTickets,
    @JsonKey(name: 'sold_tickets') required int soldTickets,
  }) = _Pricing;

  factory Pricing.fromJson(Map<String, dynamic> json) =>
      _$PricingFromJson(json);
}

@freezed
class MediaFile with _$MediaFile {
  factory MediaFile({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required bool active,
    required String host,
    @JsonKey(name: 'media_type') required String mediaType,
    required String file,
    @JsonKey(name: 'uploaded_at') required String uploadedAt,
  }) = _MediaFile;

  factory MediaFile.fromJson(Map<String, dynamic> json) =>
      _$MediaFileFromJson(json);
}

@freezed
class Location with _$Location {
  factory Location({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required bool active,
    required String host,
    required String product,
    required String coordinates,
    required String address,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
