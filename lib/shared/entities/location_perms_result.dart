import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_perms_result.freezed.dart';
part 'location_perms_result.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class LocationPermsResult with _$LocationPermsResult {
  @JsonSerializable(explicitToJson: true)
  factory LocationPermsResult({
    @Default(false) bool? denied,
    @Default(false) bool? deniedForever,
  }) = _LocationPermsResult;

  factory LocationPermsResult.initial() => LocationPermsResult();

  factory LocationPermsResult.fromJson(Map<String, dynamic> json) =>
      _$LocationPermsResultFromJson(json);
}
