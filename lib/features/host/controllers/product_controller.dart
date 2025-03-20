import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fullbooker/core/repository.dart';
import 'package:fullbooker/core/view_model.dart';
import 'package:fullbooker/domain/core/value_objects/endpoints.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/entities/date_group.dart';
import 'package:fullbooker/shared/entities/session_pricing.dart';

class ProductViewModel extends BaseViewModel<Product> {
  ProductViewModel() {
    repository = CRUDRepository<Product>('products', ProductSerializer());
  }

  late CRUDRepository<Product> _repository;

  @override
  CRUDRepository<Product> get repository => _repository;

  @override
  set repository(CRUDRepository<Product> repository) =>
      _repository = repository;

  Future<Product?> createProduct(
    String name,
    String? description,
    String subcategory,
  ) async {
    final Map<String, String> productData = <String, String>{
      'name': name,
      'subcategory': subcategory,
    };
    if (description != null) productData['description'] = description;
    try {
      repository.post(<String, Object?>{}, kDevHostsEndpoint);
      final dynamic response = await repository
          .post(productData, kDevProductsEndpoint, serialize: true);
      return response as Product;
    } catch (exception) {
      return null;
    }
  }

  Future<Map<String, Object?>?> createLocation(
    String product,
    double lat,
    double long,
    String address,
  ) async {
    final Map<String, String> objData = <String, String>{
      'product': product,
      'lat': lat.toString(),
      'long': long.toString(),
      'address': address,
    };
    try {
      final dynamic response =
          await repository.post(objData, kDevLocationEndpoint);
      return response as Map<String, Object?>;
    } catch (exception) {
      return null;
    }
  }

  String formatDate(DateTime date) {
    return '${date.year.toString()}-'
        "${date.month.toString().padLeft(2, '0')}"
        "-${date.day.toString().padLeft(2, '0')}";
  }

  Future<Map<String, Object?>?> createAvailability(
    DateGroup startDate,
    DateGroup endDate,
    String productId,
  ) async {
    final Map<String, String> availabilityData = <String, String>{
      'product': productId,
      'start': formatDate(startDate.date),
      'end': formatDate(endDate.date),
      'start_time': '${startDate.hours}:${startDate.minutes}:00',
      'end_time': '${endDate.hours}:${endDate.minutes}:00',
    };
    try {
      final dynamic response =
          await repository.post(availabilityData, '/availability/');
      return response as Map<String, Object?>;
    } catch (exception) {
      return null;
    }
  }

  Future<Map<String, Object?>?> createMedia(
    List<File> images,
    String productId,
    String mediaType,
  ) async {
    final Map<String, String> mediaData = <String, String>{
      'media_type ': mediaType,
      'product_id ': productId,
    };
    try {
      final dynamic response =
          await repository.postWithImages(mediaData, images, kDevMediaEndpoint);
      return response as Map<String, Object?>;
    } catch (exception) {
      return null;
    }
  }

  Future<List<Map<String, Object?>>?> createPricing(
    String productId,
    List<String> categories,
    String currencyId,
    Map<String, double> prices,
    Map<String, int> amounts,
  ) async {
    final List<Map<String, Object?>> pricesCreated = <Map<String, Object?>>[];
    final List<dynamic> pricesFailed = <dynamic>[];
    for (String category in categories) {
      final Map<String, String> pricingData = <String, String>{
        'name': category,
        'product': productId,
        'currency': currencyId,
        'cost': prices[category].toString(),
        'type': 'ticket',
        'maximum_number_of_tickets': amounts[category].toString(),
        'ticket_tier': _mapNameToType(category),
      };
      try {
        final dynamic response =
            await repository.post(pricingData, kDevPricingEndpoint);
        pricesCreated.add(response as Map<String, Object?>);
      } catch (exception) {
        pricesFailed.add(exception);
      }
    }

    if (pricesFailed.isNotEmpty) return null;
    return pricesCreated;
  }

  Future<Map<String, Object?>?> createActivityAvailability(
    String productId,
    Map<String, TimeOfDay> startTimes,
    Map<String, TimeOfDay> endTimes,
    List<DateTime> closedDays,
  ) async {
    final List<dynamic> openDays = <dynamic>[];
    for (String startTimeDay in startTimes.keys) {
      openDays.add(<String, String>{
        'day': startTimeDay,
        'opening_at':
            '${startTimes[startTimeDay]!.hour}:${startTimes[startTimeDay]!.minute}',
        'closing_at':
            '${endTimes[startTimeDay]!.hour}:${endTimes[startTimeDay]!.minute}',
      });
    }
    final List<Map<String, String>> closedDaysData = closedDays
        .map(
          (DateTime day) =>
              <String, String>{'date': '${day.year}-${day.month}-${day.day}'},
        )
        .toList();
    final Map<String, Object> availabilityData = <String, Object>{
      'product': productId,
      'open_days': openDays,
      'closed_dates': closedDaysData,
    };
    try {
      final dynamic response =
          await repository.post(availabilityData, kDevAvailabilityEndpoint);
      return response as Map<String, Object?>;
    } catch (exception) {
      return null;
    }
  }

  Future<List<Map<String, Object?>>?> createActivityPricing(
    String productId,
    SessionPricing session,
    SessionPricing? dayPass,
    SessionPricing? subscription,
  ) async {
    final List<Map<String, Object?>> responses = <Map<String, Object?>>[];
    final Map<String, Object> sessionPricingData = <String, Object>{
      'product': productId,
      'currency': session.currency.id,
      'cost': session.price,
      'type': 'session',
      'maximum_number_of_tickets': session.maxTickets,
    };
    try {
      final dynamic response =
          await repository.post(sessionPricingData, kDevPricingEndpoint);
      responses.add(response as Map<String, Object?>);
    } catch (exception) {
      return null;
    }

    if (dayPass != null) {
      final Map<String, Object> dayPassPricingData = <String, Object>{
        'product': productId,
        'currency': dayPass.currency.id,
        'cost': dayPass.price,
        'type': 'day_pass',
        'maximum_number_of_tickets': dayPass.maxTickets,
      };
      try {
        final dynamic response =
            await repository.post(dayPassPricingData, kDevPricingEndpoint);
        responses.add(response as Map<String, Object?>);
      } catch (exception) {
        return null;
      }
    }

    if (subscription != null) {
      final Map<String, Object> dayPassPricingData = <String, Object>{
        'product': productId,
        'currency': subscription.currency.id,
        'cost': subscription.price,
        'type': 'monthly_subscription',
        'maximum_number_of_tickets': 1,
      };
      try {
        final dynamic response = await repository.post(
          dayPassPricingData,
          '/pricing/',
        );
        responses.add(response as Map<String, Object?>);
      } catch (exception) {
        return null;
      }
    }

    return responses;
  }

  String _mapNameToType(String category) {
    final Map<String, String> optionsMapping = <String, String>{
      'Early Bird': 'early_bird',
      'Last Minute': 'last_minute',
      'Standard': 'standard',
      'Standard At The Gate': 'standard_at_the_gate',
      'VIP': 'vip',
      'VVIP': 'vvip',
    };
    return optionsMapping[category]!;
  }
}
