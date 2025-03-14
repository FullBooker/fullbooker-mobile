import 'package:fullbooker/features/host/models/product.dart';

class Ticket {
  String name;
  String id;
  String phone;
  String email;
  ProductPricing pricing;
  int quantity;

  Ticket(
    this.name,
    this.id,
    this.phone,
    this.email,
    this.pricing,
    this.quantity,
  );
}
