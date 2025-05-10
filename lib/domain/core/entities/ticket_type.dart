import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'ticket_type.freezed.dart';
part 'ticket_type.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class TicketType with _$TicketType {
  @JsonSerializable(explicitToJson: true)
  factory TicketType({
    @Default(UNKNOWN) String? id,
    @JsonKey(name: 'created_at') @Default(UNKNOWN) String? createdAt,
    @JsonKey(name: 'updated_at') @Default(UNKNOWN) String? updatedAt,
    @Default(false) bool? active,
    @Default(UNKNOWN) String? host,
    @Default(UNKNOWN) String? name,
    @Default(UNKNOWN) String? description,
    @JsonKey(name: 'pricing_option') @Default(UNKNOWN) String? pricingOption,
    @JsonKey(name: 'pricing_option_name')
    @Default(UNKNOWN)
    String? pricingOptionName,
    @JsonKey(name: 'pricing_option_type')
    @Default(UNKNOWN)
    String? pricingOptionType,
  }) = _TicketType;

  factory TicketType.fromJson(Map<String, dynamic> json) =>
      _$TicketTypeFromJson(json);
}
