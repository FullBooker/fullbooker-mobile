abstract interface class Serializer<T> {
  T fromJson(Map<String, Object?> json);
  Map<String, Object?> toJson(T object);
  String getIdKeyName();
}

abstract interface class Model {
  String getId();
}
