import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';

part 'product_media_response.freezed.dart';
part 'product_media_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProductMediaResponse with _$ProductMediaResponse {
  @JsonSerializable(explicitToJson: true)
  factory ProductMediaResponse({
    @Default(0) int count,
    String? next,
    String? previous,
    List<ProductMedia?>? results,
  }) = _ProductMediaResponse;

  factory ProductMediaResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductMediaResponseFromJson(json);
}
