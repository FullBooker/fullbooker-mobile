import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/domain/core/entities/product.dart';

part 'host_product_response.freezed.dart';
part 'host_product_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class HostProductResponse with _$HostProductResponse {
  @JsonSerializable(explicitToJson: true)
  factory HostProductResponse({
    @Default(0) int count,
    String? next,
    String? previous,
    @JsonKey(name: 'results') List<Product>? results,
  }) = _HostProductResponse;

  factory HostProductResponse.fromJson(Map<String, dynamic> json) =>
      _$HostProductResponseFromJson(json);
}
