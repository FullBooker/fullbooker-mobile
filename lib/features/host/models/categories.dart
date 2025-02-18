import 'package:fullbooker/core/models.dart';

class SubCategory implements Model {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  bool active;
  String name;
  String? description;
  String category;

  SubCategory(this.id, this.createdAt, this.updatedAt, this.active, this.name,
      this.description, this.category);

  @override
  String getId() => id;
}

class SubCategorySerializer implements Serializer<SubCategory> {
  @override
  SubCategory fromJson(Map<String, Object?> json) {
    return SubCategory(
        json["id"] as String,
        DateTime.parse(json["created_at"] as String),
        DateTime.parse(json["updated_at"] as String),
        json["active"] as bool,
        json["name"] as String,
        json["description"] as String?,
        json["category"] as String);
  }

  @override
  Map<String, Object?> toJson(SubCategory object) {
    return {
      "id": object.id,
      "created_at": object.createdAt.toString(),
      "updated_at": object.updatedAt.toString(),
      "active": object.active,
      "name": object.name,
      "description": object.description,
      "category": object.category
    };
  }

  @override
  String getIdKeyName() => "id";
}

class Category implements Model {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  bool active;
  String title;
  String? description;
  List<SubCategory> subcategories;

  Category(this.id, this.createdAt, this.updatedAt, this.active, this.title,
      this.description, this.subcategories);

  @override
  String getId() => id;
}

class CategorySerializer implements Serializer<Category> {
  @override
  Category fromJson(Map<String, Object?> json) {
    List<SubCategory> subcategories =
        (json["subcategories"] as List<dynamic>).map((subcategoryJson) {
      return SubCategorySerializer()
          .fromJson(subcategoryJson as Map<String, Object?>);
    }).toList();

    return Category(
        json["id"] as String,
        DateTime.parse(json["created_at"] as String),
        DateTime.parse(json["updated_at"] as String),
        json["active"] as bool,
        json["name"] as String,
        json["description"] as String?,
        subcategories);
  }

  @override
  Map<String, Object?> toJson(Category object) {
    return {
      "id": object.id,
      "created_at": object.createdAt.toString(),
      "updated_at": object.updatedAt.toString(),
      "active": object.active,
      "name": object.title,
      "description": object.description,
      "subcategories": object.subcategories.map((subCategory) {
        return SubCategorySerializer().toJson(subCategory);
      })
    };
  }

  @override
  String getIdKeyName() => "id";
}
