import 'package:fullbooker/core/models.dart';

class Currency implements Model {
  String id;
  String name;
  String code;

  Currency(this.id, this.name, this.code);

  @override
  String getId() => id;
}

class CurrencySerializer implements Serializer<Currency> {
  @override
  Currency fromJson(Map<String, dynamic> json) {
    return Currency(json["id"], json["name"], json["code"]);
  }

  @override
  Map<String, Object?> toJson(Currency object) {
    return {"id": object.id, "name": object.name, "code": object.code};
  }

  @override
  String getIdKeyName() => "id";
}
