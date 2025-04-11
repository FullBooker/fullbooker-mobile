import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'product_image.freezed.dart';
part 'product_image.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProductImage with _$ProductImage {
  @JsonSerializable(explicitToJson: true)
  factory ProductImage({
    @Default(UNKNOWN) String? id,
    @Default(UNKNOWN) @JsonKey(name: 'created_at') String? createdAt,
    @Default(UNKNOWN) @JsonKey(name: 'updated_at') String? updatedAt,
    @Default(false) bool? active,
    @Default(UNKNOWN) String? host,
    @Default(UNKNOWN) @JsonKey(name: 'media_type') String? mediaType,
    @Default(UNKNOWN) String? file,
    @Default(UNKNOWN) @JsonKey(name: 'uploaded_at') String? uploadedAt,
  }) = _ProductImage;

  factory ProductImage.initial() => ProductImage();

  factory ProductImage.fromJson(Map<String, dynamic> json) =>
      _$ProductImageFromJson(json);
}
