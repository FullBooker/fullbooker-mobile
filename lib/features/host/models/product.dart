import 'package:fullbooker/core/models.dart';
import 'package:fullbooker/features/auth/models/login.dart';

class Product implements Model {
  String id;
  String name;
  String? description;
  String subcategory;
  ProductHost host;
  String number;
  bool active;
  List<ProductPricing> pricing;
  ProductMedia? image;
  List<ProductLocation> locations;
  Map<String, dynamic>? availability;

  Product(
    this.id,
    this.name,
    this.description,
    this.subcategory,
    this.host,
    this.number,
    this.active,
    this.pricing,
    this.image,
    this.locations,
    this.availability,
  );

  @override
  String getId() => id;
}

class ProductSerializer implements Serializer<Product> {
  @override
  Product fromJson(Map<String, dynamic> json) {
    final List<ProductPricing> pricings = <ProductPricing>[];
    for (dynamic pricing in json['pricing'] ?? <dynamic>[]) {
      pricings.add(ProductPricingSerializer().fromJson(pricing));
    }
    final List<ProductLocation> locations = <ProductLocation>[];
    for (dynamic location in json['locations'] ?? <dynamic>[]) {
      locations.add(ProductLocationSerializer().fromJson(location));
    }
    return Product(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String?,
      json['subcategory'] as String,
      ProductHostSerializer().fromJson(json['host']),
      json['number'] as String,
      json['active'] as bool,
      pricings,
      json['image'] == null
          ? null
          : ProductMediaSerializer().fromJson(json['image']),
      locations,
      json['availability'],
    );
  }

  @override
  Map<String, Object?> toJson(Product object) {
    return <String, Object?>{
      'name': object.name,
      'description': object.description,
      'subcategory': object.subcategory,
      'number': object.number,
    };
  }

  @override
  String getIdKeyName() => 'id';
}

class ProductPricing implements Model {
  String id;
  String currency;
  String cost;
  String type;
  String? ticketTier;
  int maximumNumberOfTickets;

  ProductPricing(
    this.id,
    this.currency,
    this.cost,
    this.type,
    this.ticketTier,
    this.maximumNumberOfTickets,
  );

  @override
  String getId() => id;
}

class ProductPricingSerializer implements Serializer<ProductPricing> {
  @override
  ProductPricing fromJson(Map<String, dynamic> json) {
    return ProductPricing(
      json['id'] as String,
      json['currency'] as String,
      json['cost'] as String,
      json['type'] as String,
      json['ticket_tier'] as String?,
      json['maximum_number_of_tickets'] as int,
    );
  }

  @override
  Map<String, Object?> toJson(ProductPricing object) {
    return <String, Object?>{
      'currency': object.currency,
      'cost': object.cost,
      'type': object.type,
      'ticket_tier': object.ticketTier,
      'maximum_number_of_tickets': object.maximumNumberOfTickets,
    };
  }

  @override
  String getIdKeyName() => 'id';
}

class ProductMedia implements Model {
  String id;
  String host;
  String mediaType;
  String file;

  ProductMedia(this.id, this.host, this.mediaType, this.file);

  @override
  String getId() => id;
}

class ProductMediaSerializer implements Serializer<ProductMedia> {
  @override
  ProductMedia fromJson(Map<String, dynamic> json) {
    return ProductMedia(
      json['id'] as String,
      json['host'] as String,
      json['media_type'] as String,
      json['file'] as String,
    );
  }

  @override
  Map<String, Object?> toJson(ProductMedia object) {
    return <String, Object?>{
      'host': object.host,
      'media_type': object.mediaType,
      'file': object.file,
    };
  }

  @override
  String getIdKeyName() => 'id';
}

class ProductLocation implements Model {
  String id;
  String coordinates;

  ProductLocation(this.id, this.coordinates);

  @override
  String getId() => id;
}

class ProductLocationSerializer implements Serializer<ProductLocation> {
  @override
  ProductLocation fromJson(Map<String, dynamic> json) {
    return ProductLocation(json['id'], json['coordinates']);
  }

  @override
  Map<String, Object?> toJson(ProductLocation object) {
    return <String, Object?>{
      'id': object.id,
      'coordinates': object.coordinates,
    };
  }

  @override
  String getIdKeyName() => 'id';
}

class ProductHost implements Model {
  String id;
  User user;

  ProductHost(this.id, this.user);

  @override
  String getId() => id;

  @override
  String toString() => id;
}

class ProductHostSerializer implements Serializer<ProductHost> {
  @override
  ProductHost fromJson(Map<String, dynamic> json) {
    return ProductHost(json['id'], UserSerializer().fromJson(json['user']));
  }

  @override
  Map<String, Object?> toJson(ProductHost object) {
    return <String, Object?>{
      'id': object.id,
      'user': UserSerializer().toJson(object.user),
    };
  }

  @override
  String getIdKeyName() => 'id';
}
