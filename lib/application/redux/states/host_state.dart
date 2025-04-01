// Package imports:

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/domain/core/entities/product.dart';

part 'host_state.freezed.dart';
part 'host_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class HostState with _$HostState {
  @JsonSerializable(explicitToJson: true)
  factory HostState({
    @Default(<Product>[]) List<Product>? products,
    Product? currentProduct,
    Product? selectedProduct,
  }) = _HostState;

  factory HostState.initial() => HostState();

  factory HostState.fromJson(Map<String, dynamic> json) =>
      _$HostStateFromJson(json);
}
