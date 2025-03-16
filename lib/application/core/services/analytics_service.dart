// Dart imports:
import 'dart:async';

// Package imports:
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  /// Initializes the general app metrics for this user for this device
  Future<void> init({required String environment}) async {
    await _analytics.setAnalyticsCollectionEnabled(true);

    await _analytics.setUserProperty(name: 'environment', value: environment);
  }

  Future<void> reset() async => _analytics.setUserId();

  /// Sets the current user ID
  Future<void> setUserId(String? id) async {
    if (id?.isNotEmpty ?? false) {
      await _analytics.setUserId(id: id);
    }
  }

  /// Logs a user event by enriching the parameters with general metadata
  Future<void> logEvent({
    required String name,
    Map<String, String>? parameters,
  }) async {
    await _analytics.logEvent(name: name, parameters: parameters);
  }
}
