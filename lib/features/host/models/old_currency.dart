import 'package:fullbooker/core/models.dart';

class OldCurrency implements Model {
  String id;
  String name;
  String code;

  OldCurrency(this.id, this.name, this.code);

  @override
  String getId() => id;
}

class CurrencySerializer implements Serializer<OldCurrency> {
  @override
  OldCurrency fromJson(Map<String, dynamic> json) {
    return OldCurrency(json['id'], json['name'], json['code']);
  }

  @override
  Map<String, Object?> toJson(OldCurrency object) {
    return <String, Object?>{
      'id': object.id,
      'name': object.name,
      'code': object.code,
    };
  }

  @override
  String getIdKeyName() => 'id';
}
