import 'package:fullbooker/features/host/models/old_currency.dart';

class SessionPricing {
  final double price;
  final int maxTickets;
  final OldCurrency currency;

  const SessionPricing({
    required this.price,
    required this.maxTickets,
    required this.currency,
  });
}
