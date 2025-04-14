import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/domain/core/entities/product_image.dart';

part 'product_media_state.freezed.dart';
part 'product_media_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProductMediaState with _$ProductMediaState {
  @JsonSerializable(explicitToJson: true)
  const factory ProductMediaState({
    @Default(<ProductImage>[]) List<ProductImage> media,
  }) = _ProductMediaState;

  factory ProductMediaState.initial() => const ProductMediaState();

  factory ProductMediaState.fromJson(Map<String, dynamic> json) =>
      _$ProductMediaStateFromJson(json);
}
