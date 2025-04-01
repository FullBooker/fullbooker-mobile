import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_location.freezed.dart';
part 'product_location.g.dart';

@freezed
class ProductLocation with _$ProductLocation {
  factory ProductLocation({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required bool active,
    required String host,
    required String product,
    required String coordinates,
    required String address,
  }) = _ProductLocation;

  factory ProductLocation.fromJson(Map<String, dynamic> json) =>
      _$ProductLocationFromJson(json);
}
