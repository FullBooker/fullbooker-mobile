import 'package:fullbooker/core/models.dart';

class Product implements Model {
  String id;
  String name;
  String? description;
  String subcategory;
  String host;
  String number;
  bool active;
  List<ProductPricing> pricing;

  Product(this.id, this.name, this.description, this.subcategory, this.host,
      this.number, this.active, this.pricing);

  @override
  String getId() => id;
}

class ProductSerializer implements Serializer<Product> {
  @override
  Product fromJson(Map<String, dynamic> json) {
    List<ProductPricing> pricings = [];
    for (var pricing in json["pricing"] ?? []) {
      pricings.add(ProductPricingSerializer().fromJson(pricing));
    }
    return Product(
        json["id"] as String,
        json["name"] as String,
        json["description"] as String?,
        json["subcategory"] as String,
        json["host"] as String,
        json["number"] as String,
        json["active"] as bool,
        pricings);
  }

  @override
  Map<String, Object?> toJson(Product object) {
    return {
      "name": object.name,
      "description": object.description,
      "subcategory": object.subcategory,
      "number": object.number
    };
  }

  @override
  String getIdKeyName() => "id";
}

class ProductPricing implements Model {
  String id;
  String currency;
  String cost;
  String type;
  String? ticket_tier;
  int maximum_number_of_tickets;

  ProductPricing(this.id, this.currency, this.cost, this.type, this.ticket_tier,
      this.maximum_number_of_tickets);

  @override
  String getId() => id;
}

class ProductPricingSerializer implements Serializer<ProductPricing> {
  @override
  ProductPricing fromJson(Map<String, dynamic> json) {
    return ProductPricing(
        json["id"] as String,
        json["currency"] as String,
        json["cost"] as String,
        json["type"] as String,
        json["ticket_tier"] as String?,
        json["maximum_number_of_tickets"] as int);
  }

  @override
  Map<String, Object?> toJson(ProductPricing object) {
    return {
      "currency": object.currency,
      "cost": object.cost,
      "type": object.type,
      "ticket_tier": object.ticket_tier,
      "maximum_number_of_tickets": object.maximum_number_of_tickets
    };
  }

  @override
  String getIdKeyName() => "id";
}
