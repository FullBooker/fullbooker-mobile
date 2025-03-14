import 'package:fullbooker/features/host/models/currency.dart';

class SessionPricing {
  final double price;
  final int maxTickets;
  final Currency currency;

  const SessionPricing({
    required this.price,
    required this.maxTickets,
    required this.currency,
  });
}
