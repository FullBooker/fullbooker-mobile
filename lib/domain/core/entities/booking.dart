import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

// TODO(abiud): bring this back when the API matches this response
// @Freezed(makeCollectionsUnmodifiable: false)
// class Booking with _$Booking {
//   @JsonSerializable(explicitToJson: true)
//   factory Booking({
//     @Default(UNKNOWN) String? id,
//     @JsonKey(name: 'created_at') @Default(UNKNOWN) String? createdAt,
//     @JsonKey(name: 'updated_at') @Default(UNKNOWN) String? updatedAt,
//     @Default(false) bool? active,
//     UserState? user,
//     @Default(UNKNOWN) String? bookingType,
//     @Default(false) bool? verified,
//     @Default(UNKNOWN) String? bookedOn,
//     @Default(0) double? price,
//     @Default(UNKNOWN) String? status,
//   }) = _Booking;

//   factory Booking.initial() => Booking(
//         user: UserState.initial(),
//       );

//   factory Booking.fromJson(Map<String, dynamic> json) =>
//       _$BookingFromJson(json);
// }

@Freezed(makeCollectionsUnmodifiable: false)
class Booking with _$Booking {
  @JsonSerializable(explicitToJson: true)
  factory Booking({
    @Default(UNKNOWN) String? id,
    @JsonKey(name: 'created_at') @Default(UNKNOWN) String? createdAt,
    @JsonKey(name: 'updated_at') @Default(UNKNOWN) String? updatedAt,
    @Default(false) bool? active,
    @Default(UNKNOWN) String? host,
    @Default(UNKNOWN) String? product,
    @Default(UNKNOWN) String? user,
    @Default(UNKNOWN) String? status,
    @JsonKey(name: 'total_cost') @Default(UNKNOWN) String? totalCost,
    @JsonKey(name: 'total_tickets_count') @Default(0) int? totalTicketsCount,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
}
