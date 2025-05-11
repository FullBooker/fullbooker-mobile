import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/core/common/constants.dart';

part 'product_terms_response.freezed.dart';
part 'product_terms_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProductTermsResponse with _$ProductTermsResponse {
  @JsonSerializable(explicitToJson: true)
  factory ProductTermsResponse({
    @Default(UNKNOWN) String? id,
    @JsonKey(name: 'created_at') @Default(UNKNOWN) String? createdAt,
    @JsonKey(name: 'updated_at') @Default(UNKNOWN) String? updatedAt,
    @Default(false) bool? active,
    @Default(UNKNOWN) String? host,
    @Default(UNKNOWN) String? product,
    @Default(false) bool? accepted,
    @JsonKey(name: 'accepted_at') @Default(UNKNOWN) String? acceptedAt,
    @JsonKey(name: 'terms_url') @Default(UNKNOWN) String? termsUrl,
  }) = _ProductTermsResponse;

  factory ProductTermsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductTermsResponseFromJson(json);
}
