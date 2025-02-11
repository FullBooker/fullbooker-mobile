import 'package:fullbooker/core/models.dart';

class Days implements Model {
  String id;
  String name;

  Days(this.id, this.name);

  @override
  String getId() => id;
}

class DaysSerializer implements Serializer<Days> {
  @override
  Days fromJson(Map<String, dynamic> json) {
    return Days(json["id"], json["name"]);
  }

  @override
  Map<String, Object?> toJson(Days object) {
    return {"id": object.id, "name": object.name};
  }

  @override
  String getIdKeyName() => "id";
}
