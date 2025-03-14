import 'package:fullbooker/core/models.dart';

class SubCategory implements Model {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  bool active;
  String name;
  String? description;
  String category;

  SubCategory(
    this.id,
    this.createdAt,
    this.updatedAt,
    this.active,
    this.name,
    this.description,
    this.category,
  );

  @override
  String getId() => id;
}
