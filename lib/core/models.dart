abstract interface class Serializer<T> {
  T fromJson(Map<String, dynamic> json);
  Map<String, Object?> toJson(T object);
  String getIdKeyName();
}

abstract interface class Model {
  String getId();
}
