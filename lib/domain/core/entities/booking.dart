import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/application/redux/states/user_state.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

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
    @Default(UNKNOWN) String? status,
    @JsonKey(name: 'total_cost') @Default(UNKNOWN) String? totalCost,
    @JsonKey(name: 'total_tickets_count') @Default(0) int? totalTicketsCount,
    @JsonKey(name: 'user_details') UserState? user,
    @JsonKey(name: 'confirmed_on') String? confirmedOn,
  }) = _Booking;

  factory Booking.initial() => Booking(user: UserState.initial());

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
}
