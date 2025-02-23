import 'package:fullbooker/features/host/models/categories.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';

String randomString({int length = 6}) {
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();

  return String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}

double randomDouble({double max = 20000, double min = 10000}) {
  Random rnd = Random();
  return rnd.nextDouble() * (max - min) + min;
}

int randomInt({int max = 2000}) {
  Random rnd = Random();
  return rnd.nextInt(max);
}

var uuid = const Uuid();

Category getCategory() {
  return Category(uuid.v4(), DateTime.now(), DateTime.now(), true,
      randomString(), null, []);
}

SubCategory getSubCategory({Category? category, String? name}) {
  Category categoryLocal = category ?? getCategory();
  var subCategory = SubCategory(uuid.v4(), DateTime.now(), DateTime.now(), true,
      name ?? randomString(), null, categoryLocal.id);
  categoryLocal.subcategories.add(subCategory);
  return subCategory;
}

ProductPricing getProductPricing({double? price}) {
  return ProductPricing(
      uuid.v4(),
      uuid.v4(),
      (price ?? randomDouble()).toStringAsFixed(0),
      randomString(),
      randomString(),
      randomInt());
}

ProductMedia getProductMedia({required String url}) {
  return ProductMedia(uuid.v4(), uuid.v4(), randomString(), url);
}

ProductLocation getProductLocation() {
  return ProductLocation(uuid.v4(), "SRID=4326;POINT (36.8133793 -1.2949716)");
}

Map<String, dynamic> getAvailability() {
  return {
    "id": "debfc057-f6cc-4682-91f1-5c8c7c5380d6",
    "product": "c81d6ee5-a9fd-4046-8fde-5077bd3ecde5",
    "product_name": "Quad Biking 10",
    "start": null,
    "end": null,
    "start_time": null,
    "end_time": null,
    "duration": null,
    "open_days": [
      {
        "id": "e0b9eac7-e420-4e23-85dd-d82213b6f411",
        "created_at": "2025-02-12T09:57:35.395512Z",
        "updated_at": "2025-02-12T09:57:35.395529Z",
        "active": true,
        "host": "d060199b-f032-40f9-adb2-9de24de3b2cf",
        "day": "7060954a-a354-49f1-8b8e-21aefbe6f995",
        "day_name": "Monday",
        "opening_at": "23:34:00",
        "closing_at": "23:57:00"
      }
    ],
    "closed_dates": [
      {
        "id": "fb65d6f4-a972-4de2-80d6-61d9d526cf5c",
        "created_at": "2025-02-12T09:57:35.399393Z",
        "updated_at": "2025-02-12T09:57:35.399406Z",
        "active": true,
        "host": "d060199b-f032-40f9-adb2-9de24de3b2cf",
        "date": "2025-02-13"
      }
    ]
  };
}

Product getProduct(
    {String? imageUrl,
    SubCategory? subCategory,
    List<ProductPricing>? pricingOptions,
    List<ProductLocation>? locations,
    Map<String, dynamic>? availability,
    String? name,
    String? subCategoryName}) {
  return Product(
    uuid.v4(),
    name ?? randomString(),
    randomString(),
    subCategory?.id ?? getSubCategory(name: subCategoryName).id,
    uuid.v4(),
    randomString(),
    true,
    pricingOptions ?? [getProductPricing(), getProductPricing()],
    imageUrl == null ? null : getProductMedia(url: imageUrl),
    locations ?? [getProductLocation()],
    availability ?? getAvailability(),
  );
}

final productImages = [
  "https://i.imgur.com/aqOo5Ao.png",
  "https://i.imgur.com/uXBwWkK.png",
  "https://i.imgur.com/9KrQ1c7.png",
  "https://i.imgur.com/Fhw9EqV.png",
  "https://i.imgur.com/D6FdHMN.png",
  "https://i.imgur.com/tIXPEJv.png"
];

final subCategories = [
  "Quad Biking",
  "Concert",
  "Motor Bike Racing",
  "Color Fest",
  "Marathon",
  "Gym",
  "Yoga"
];

List<Product> getMultipleProducts() {
  return List.generate(productImages.length, (idx) {
    return getProduct(
      imageUrl: productImages[idx],
      name: "Rock Concert",
    );
  });
}

String randomCategory() {
  Random rnd = Random();
  var idx = rnd.nextInt(subCategories.length - 1);
  return subCategories[idx];
}
