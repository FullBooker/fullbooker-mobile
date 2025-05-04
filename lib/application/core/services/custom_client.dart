import 'package:fullbooker/application/core/services/i_custom_client.dart';

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:fullbooker/application/redux/actions/update_auth_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/auth_credentials.dart';

class CustomClient extends ICustomClient {
  CustomClient({
    required this.context,
    required String accessToken,
    required this.refreshTokenEndpoint,
    required this.refreshToken,
    this.headers,
    http.Client? client,
  }) : _client = client ?? http.Client() {
    super.accessToken = accessToken;
  }

  final BuildContext context;
  final Map<String, String>? headers;
  final String refreshToken;
  final String refreshTokenEndpoint;

  final http.Client _client;
  bool _isRefreshing = false;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final bool isSignedIn =
        StoreProvider.state<AppState>(context).authState?.isSignedIn ?? false;

    if (!isSignedIn) {
      request.headers.addAll(<String, String>{...?headers});
      return _client.send(request);
    }

    request.headers.addAll(<String, String>{...?headers});
    final String? expiryDateString = StoreProvider.state<AppState>(context)
        .authState
        ?.authCredentials
        ?.expiresAt;

    final DateTime expiryDateTime =
        DateTime.tryParse(expiryDateString ?? '') ?? DateTime.now();

    final bool shouldRefreshToken =
        hasTokenExpired(expiryDateTime, DateTime.now()) || refreshToken.isEmpty;

    if (!shouldRefreshToken) {
      return _client.send(request);
    }

    // Prevent multiple refresh attempts for the same request
    if (_isRefreshing) {
      return _client.send(request);
    }

    _isRefreshing = true;

    final AuthCredentials? newAuthCredentials = await _refreshUserToken();

    if (newAuthCredentials != null) {
      request.headers.addAll(<String, String>{
        'Authorization': 'Bearer ${newAuthCredentials.accessToken}',
      });

      context.dispatch(
        UpdateAuthStateAction(
          accessToken: newAuthCredentials.accessToken,
          refreshToken: newAuthCredentials.refreshToken,
          expiresAt: newAuthCredentials.expiresAt,
        ),
      );
    }

    _isRefreshing = false;

    return _client.send(request);
  }

  Future<AuthCredentials?> _refreshUserToken() async {
    final String endpoint = refreshTokenEndpoint;
    final Map<String, dynamic> body = <String, dynamic>{
      'refresh': refreshToken,
    };

    final Map<String, String> headers = <String, String>{
      'Accept': 'application/json',
      'content-type': 'application/json',
    };

    final http.Response response = await http.post(
      Uri.parse(endpoint),
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;

      return AuthCredentials.fromJson(data);
    }

    return null;
  }
}
