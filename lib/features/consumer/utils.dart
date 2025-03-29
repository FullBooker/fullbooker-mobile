import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/features/auth/models/login.dart';
import 'package:fullbooker/features/host/models/categories.dart';
import 'package:fullbooker/features/host/models/old_product.dart';
import 'package:fullbooker/features/host/models/sub_category_model.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';
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

Map<String, dynamic> getAvailability() => availabilityMockResponse;

OldProduct getProduct({
  String? imageUrl,
  SubCategory? subCategory,
  List<ProductPricing>? pricingOptions,
  List<ProductLocation>? locations,
  Map<String, dynamic>? availability,
  String? name,
  String? subCategoryName,
}) {
  return OldProduct(
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

final List<String> subCategories = <String>[
  'Quad Biking',
  'Concert',
  'Motor Bike Racing',
  'Color Fest',
  'Marathon',
  'Gym',
  'Yoga',
];

List<OldProduct> getMultipleProducts() {
  return List<OldProduct>.generate(productImages.length, (int idx) {
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
    kidsIconPath: Category(
      uuid.v4(),
      DateTime.now(),
      DateTime.now(),
      true,
      'Kids',
      null,
      <SubCategory>[],
    ),
    concertsIconPath: Category(
      uuid.v4(),
      DateTime.now(),
      DateTime.now(),
      true,
      'Concerts',
      null,
      <SubCategory>[],
    ),
    gymIconPath: Category(
      uuid.v4(),
      DateTime.now(),
      DateTime.now(),
      true,
      'Gyms',
      null,
      <SubCategory>[],
    ),
    goCartIconPath: Category(
      uuid.v4(),
      DateTime.now(),
      DateTime.now(),
      true,
      'Go Karting',
      null,
      <SubCategory>[],
    ),
    swimmingIconPath: Category(
      uuid.v4(),
      DateTime.now(),
      DateTime.now(),
      true,
      'Swimming',
      null,
      <SubCategory>[],
    ),
    carIconPath: Category(
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
