import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fullbooker/core/repository.dart';
import 'package:fullbooker/core/view_model.dart';
import 'package:fullbooker/features/events/models/product.dart';
import 'package:fullbooker/features/events/pages/activity_day_pass.dart';
import 'package:fullbooker/features/events/pages/date_selection.dart';

class ProductViewModel extends BaseViewModel<Product> {
  late CRUDRepository<Product> _repository;
  @override
  CRUDRepository<Product> get repository => _repository;
  @override
  set repository(CRUDRepository<Product> repository) =>
      _repository = repository;

  ProductViewModel() {
    repository = CRUDRepository<Product>("products", ProductSerializer());
  }

  Future<Product?> createProduct(
      String name, String? description, String subcategory) async {
    var productData = {"name": name, "subcategory": subcategory};
    if (description != null) productData["description"] = description;
    try {
      repository.post({}, "/hosts/");
      var response =
          await repository.post(productData, "/products/", serialize: true);
      return response as Product;
    } catch (exception) {
      return null;
    }
  }

  Future<Map<String, Object?>?> createLocation(
      String product, double lat, double long) async {
    var objData = {
      "product": product,
      "lat": lat.toString(),
      "long": long.toString()
    };
    try {
      var response = await repository.post(objData, "/location/");
      return response as Map<String, Object?>;
    } catch (exception) {
      return null;
    }
  }

  String formatDate(DateTime date) {
    return "${date.year.toString()}-"
        "${date.month.toString().padLeft(2, '0')}"
        "-${date.day.toString().padLeft(2, '0')}";
  }

  Future<Map<String, Object?>?> createAvailability(
      DateGroup startDate, DateGroup endDate, String productId) async {
    var availabilityData = {
      "product": productId,
      "start": formatDate(startDate.date),
      "end": formatDate(endDate.date),
      "start_time": "${startDate.hours}:${startDate.minutes}:00",
      "end_time": "${endDate.hours}:${endDate.minutes}:00"
    };
    try {
      var response = await repository.post(availabilityData, "/availability/");
      return response as Map<String, Object?>;
    } catch (exception) {
      return null;
    }
  }

  Future<Map<String, Object?>?> createMedia(
      List<File> images, String productId, String mediaType) async {
    var mediaData = {
      "media_type ": mediaType,
      "product_id ": productId,
    };
    try {
      var response =
          await repository.postWithImages(mediaData, images, "/media/");
      return response as Map<String, Object?>;
    } catch (exception) {
      return null;
    }
  }

  String _mapNameToType(String category) {
    var optionsMapping = {
      "Early Bird": "early_bird",
      "Last Minute": "last_minute",
      "Standard": "standard",
      "Standard At The Gate": "standard_at_the_gate",
      "VIP": "vip",
      "VVIP": "vvip"
    };
    return optionsMapping[category]!;
  }

  Future<List<Map<String, Object?>>?> createPricing(
      String productId,
      List<String> categories,
      String currencyId,
      Map<String, double> prices,
      Map<String, int> amounts) async {
    List<Map<String, Object?>> pricesCreated = [];
    var pricesFailed = [];
    for (var category in categories) {
      var pricingData = {
        "name": category,
        "product": productId,
        "currency": currencyId,
        "cost": prices[category].toString(),
        "type": "ticket",
        "maximum_number_of_tickets": amounts[category].toString(),
        "ticket_tier": _mapNameToType(category)
      };
      try {
        var response = await repository.post(pricingData, "/pricing/");
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
      List<DateTime> closedDays) async {
    var openDays = [];
    for (var startTimeDay in startTimes.keys) {
      openDays.add({
        "day": startTimeDay,
        "opening_at":
            "${startTimes[startTimeDay]!.hour}:${startTimes[startTimeDay]!.minute}",
        "closing_at":
            "${endTimes[startTimeDay]!.hour}:${endTimes[startTimeDay]!.minute}"
      });
    }
    var closedDaysData = closedDays
        .map((day) => {"date": "${day.year}-${day.month}-${day.day}"})
        .toList();
    var availabilityData = {
      "product": productId,
      "open_days": openDays,
      "closed_dates": closedDaysData
    };
    try {
      var response = await repository.post(availabilityData, "/availability/");
      return response as Map<String, Object?>;
    } catch (exception) {
      return null;
    }
  }

  Future<List<Map<String, Object?>>?> createActivityPricing(
      String productId,
      SessionPricing session,
      SessionPricing? dayPass,
      SessionPricing? subscription) async {
    List<Map<String, Object?>> responses = [];
    var sessionPricingData = {
      "product": productId,
      "currency": session.currency.id,
      "cost": session.price,
      "type": "session",
      "maximum_number_of_tickets": session.maxTickets
    };
    try {
      var response = await repository.post(sessionPricingData, "/pricing/");
      responses.add(response as Map<String, Object?>);
    } catch (exception) {
      return null;
    }

    if (dayPass != null) {
      var dayPassPricingData = {
        "product": productId,
        "currency": dayPass.currency.id,
        "cost": dayPass.price,
        "type": "day_pass",
        "maximum_number_of_tickets": dayPass.maxTickets
      };
      try {
        var response = await repository.post(dayPassPricingData, "/pricing/");
        responses.add(response as Map<String, Object?>);
      } catch (exception) {
        return null;
      }
    }

    if (subscription != null) {
      var dayPassPricingData = {
        "product": productId,
        "currency": subscription.currency.id,
        "cost": subscription.price,
        "type": "monthly_subscription",
        "maximum_number_of_tickets": 1
      };
      try {
        var response = await repository.post(dayPassPricingData, "/pricing/");
        responses.add(response as Map<String, Object?>);
      } catch (exception) {
        return null;
      }
    }

    return responses;
  }
}
