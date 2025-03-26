// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/domain/core/entities/host_product_response.dart';

part 'host_state.freezed.dart';
part 'host_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class HostState with _$HostState {
  @JsonSerializable(explicitToJson: true)
  factory HostState({
    @Default(<HostProduct>[]) List<HostProduct?>? products,
  }) = _HostState;

  factory HostState.initial() => HostState();

  factory HostState.fromJson(Map<String, dynamic> json) =>
      _$HostStateFromJson(json);
}
