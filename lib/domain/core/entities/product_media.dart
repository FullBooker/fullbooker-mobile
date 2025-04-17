import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'product_media.freezed.dart';
part 'product_media.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProductMedia with _$ProductMedia {
  @JsonSerializable(explicitToJson: true)
  factory ProductMedia({
    @Default(UNKNOWN) String? id,
    @Default(UNKNOWN) @JsonKey(name: 'created_at') String? createdAt,
    @Default(UNKNOWN) @JsonKey(name: 'updated_at') String? updatedAt,
    @Default(false) bool? active,
    @Default(UNKNOWN) String? host,
    @Default(UNKNOWN) @JsonKey(name: 'media_type') String? mediaType,
    @Default(UNKNOWN) String? file,
    @Default(UNKNOWN) @JsonKey(name: 'uploaded_at') String? uploadedAt,
  }) = _ProductMedia;

  factory ProductMedia.initial() => ProductMedia();

  factory ProductMedia.fromJson(Map<String, dynamic> json) =>
      _$ProductMediaFromJson(json);
}
