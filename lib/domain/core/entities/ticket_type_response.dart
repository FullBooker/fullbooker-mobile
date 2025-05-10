import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/domain/core/entities/ticket_type.dart';

part 'ticket_type_response.freezed.dart';
part 'ticket_type_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class TicketTypeResponse with _$TicketTypeResponse {
  @JsonSerializable(explicitToJson: true)
  factory TicketTypeResponse({
    @Default(0) int count,
    String? next,
    String? previous,
    List<TicketType?>? results,
  }) = _TicketTypeResponse;

  factory TicketTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketTypeResponseFromJson(json);
}
