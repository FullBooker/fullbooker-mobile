import 'package:fullbooker/features/auth/models/login.dart';
import 'package:fullbooker/features/host/models/categories.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';

String randomString({int length = 6}) {
  const String chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random rnd = Random();

  return String.fromCharCodes(
    Iterable<int>.generate(
      length,
      (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
    ),
  );
}

double randomDouble({double max = 20000, double min = 10000}) {
  final Random rnd = Random();
  return rnd.nextDouble() * (max - min) + min;
}

int randomInt({int max = 2000}) {
  final Random rnd = Random();
  return rnd.nextInt(max);
}

Uuid uuid = const Uuid();

Category getCategory() {
  return Category(
    uuid.v4(),
    DateTime.now(),
    DateTime.now(),
    true,
    randomString(),
    null,
    <SubCategory>[],
  );
}

User getUser() {
  return User(randomString(), randomString(), 'test@mail.com', '0711222333');
}

ProductHost getProductHost() {
  return ProductHost(uuid.v4(), getUser());
}

SubCategory getSubCategory({Category? category, String? name}) {
  final Category categoryLocal = category ?? getCategory();
  final SubCategory subCategory = SubCategory(
    uuid.v4(),
    DateTime.now(),
    DateTime.now(),
    true,
    name ?? randomString(),
    null,
    categoryLocal.id,
  );
  categoryLocal.subcategories.add(subCategory);
  return subCategory;
}

ProductPricing getProductPricing({double? price}) {
  return ProductPricing(
    uuid.v4(),
    uuid.v4(),
    (price ?? randomDouble()).toStringAsFixed(2),
    randomString(),
    randomString(),
    randomInt(),
  );
}

ProductMedia getProductMedia({required String url}) {
  return ProductMedia(uuid.v4(), uuid.v4(), randomString(), url);
}

ProductLocation getProductLocation() {
  return ProductLocation(uuid.v4(), 'SRID=4326;POINT (36.8133793 -1.2949716)');
}

Map<String, dynamic> getAvailability() {
  return <String, dynamic>{
    'id': 'debfc057-f6cc-4682-91f1-5c8c7c5380d6',
    'product': 'c81d6ee5-a9fd-4046-8fde-5077bd3ecde5',
    'product_name': 'Quad Biking 10',
    'start': null,
    'end': null,
    'start_time': null,
    'end_time': null,
    'duration': null,
    'open_days': <Map<String, Object>>[
      <String, Object>{
        'id': 'e0b9eac7-e420-4e23-85dd-d82213b6f411',
        'created_at': '2025-02-12T09:57:35.395512Z',
        'updated_at': '2025-02-12T09:57:35.395529Z',
        'active': true,
        'host': 'd060199b-f032-40f9-adb2-9de24de3b2cf',
        'day': '7060954a-a354-49f1-8b8e-21aefbe6f995',
        'day_name': 'Monday',
        'opening_at': '23:34:00',
        'closing_at': '23:57:00',
      }
    ],
    'closed_dates': <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 'fb65d6f4-a972-4de2-80d6-61d9d526cf5c',
        'created_at': '2025-02-12T09:57:35.399393Z',
        'updated_at': '2025-02-12T09:57:35.399406Z',
        'active': true,
        'host': 'd060199b-f032-40f9-adb2-9de24de3b2cf',
        'date': '2025-02-13',
      }
    ],
  };
}

Product getProduct({
  String? imageUrl,
  SubCategory? subCategory,
  List<ProductPricing>? pricingOptions,
  List<ProductLocation>? locations,
  Map<String, dynamic>? availability,
  String? name,
  String? subCategoryName,
}) {
  return Product(
    uuid.v4(),
    name ?? randomString(),
    randomString(),
    subCategory?.id ?? getSubCategory(name: subCategoryName).id,
    getProductHost(),
    randomString(),
    true,
    pricingOptions ??
        <ProductPricing>[getProductPricing(), getProductPricing()],
    imageUrl == null ? null : getProductMedia(url: imageUrl),
    locations ?? <ProductLocation>[getProductLocation()],
    availability ?? getAvailability(),
  );
}

final List<String> productImages = <String>[
  'https://i.imgur.com/aqOo5Ao.png',
  'https://i.imgur.com/uXBwWkK.png',
  'https://i.imgur.com/9KrQ1c7.png',
  'https://i.imgur.com/Fhw9EqV.png',
  'https://i.imgur.com/D6FdHMN.png',
  'https://i.imgur.com/tIXPEJv.png',
];

final List<String> subCategories = <String>[
  'Quad Biking',
  'Concert',
  'Motor Bike Racing',
  'Color Fest',
  'Marathon',
  'Gym',
  'Yoga',
];

List<Product> getMultipleProducts() {
  return List<Product>.generate(productImages.length, (int idx) {
    return getProduct(
      imageUrl: productImages[idx],
      name: 'Rock Concert',
    );
  });
}

String randomCategory() {
  final Random rnd = Random();
  final int idx = rnd.nextInt(subCategories.length - 1);
  return subCategories[idx];
}

Map<String, Category> getCategories() {
  return <String, Category>{
    'assets/icons/kids_icon.png': Category(
      uuid.v4(),
      DateTime.now(),
      DateTime.now(),
      true,
      'Kids',
      null,
      <SubCategory>[],
    ),
    'assets/icons/concerts_icon.png': Category(
      uuid.v4(),
      DateTime.now(),
      DateTime.now(),
      true,
      'Concerts',
      null,
      <SubCategory>[],
    ),
    'assets/icons/gym_icon.png': Category(
      uuid.v4(),
      DateTime.now(),
      DateTime.now(),
      true,
      'Gyms',
      null,
      <SubCategory>[],
    ),
    'assets/icons/go_cart_icon.png': Category(
      uuid.v4(),
      DateTime.now(),
      DateTime.now(),
      true,
      'Go Karting',
      null,
      <SubCategory>[],
    ),
    'assets/icons/swimming_icon.png': Category(
      uuid.v4(),
      DateTime.now(),
      DateTime.now(),
      true,
      'Swimming',
      null,
      <SubCategory>[],
    ),
    'assets/icons/car_icon.png': Category(
      uuid.v4(),
      DateTime.now(),
      DateTime.now(),
      true,
      'Car Shows',
      null,
      <SubCategory>[],
    ),
  };
}
