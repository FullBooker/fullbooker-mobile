import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'product_location.freezed.dart';
part 'product_location.g.dart';

@freezed
class ProductLocation with _$ProductLocation {
  @JsonSerializable(explicitToJson: true)
  factory ProductLocation({
    @Default(UNKNOWN) String id,
    @JsonKey(name: 'created_at') @Default(UNKNOWN) String createdAt,
    @JsonKey(name: 'updated_at') @Default(UNKNOWN) String updatedAt,
    @Default(false) bool active,
    @Default(UNKNOWN) String host,
    @Default(UNKNOWN) String product,
    @Default(UNKNOWN) String coordinates,
    @Default(UNKNOWN) String address,
  }) = _ProductLocation;

  factory ProductLocation.initial() => ProductLocation();

  factory ProductLocation.fromJson(Map<String, dynamic> json) =>
      _$ProductLocationFromJson(json);
}
