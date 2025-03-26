import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/states/auth_credentials.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:fullbooker/application/redux/actions/update_auth_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:async_redux/async_redux.dart';

class CustomClient extends ICustomClient {
  CustomClient({
    required this.context,
    required String accessToken,
    this.headers,
    this.authenticated = true,
    required this.refreshToken,
    required this.refreshTokenEndpoint,
    Client? client,
  }) : _client = client ?? Client() {
    super.accessToken = accessToken;
  }

  final Map<String, String>? headers;
  final BuildContext context;
  final bool authenticated;
  final Client _client;
  final String refreshToken;
  final String refreshTokenEndpoint;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    // Skip auth check for unauthenticated requests
    if (authenticated) {
      final AppState store = StoreProvider.state<AppState>(context);
      final AuthCredentials? credentials = store.authState?.authCredentials;
      final String? expiry = credentials?.expiresAt;

      final DateTime expiryDate = expiry != null
          ? DateTime.tryParse(expiry) ?? DateTime.now()
          : DateTime.now();

      final bool shouldRefreshToken =
          (credentials?.accessToken.isEmpty ?? true) ||
              hasTokenExpired(expiryDate, DateTime.now());

      if (shouldRefreshToken &&
          (credentials?.refreshToken.isNotEmpty ?? false)) {
        final AuthCredentials? refreshedCredentials =
            await _refreshUserToken(credentials!.refreshToken);
        if (refreshedCredentials != null) {
          StoreProvider.dispatch<AppState>(
            context,
            UpdateAuthStateAction(
              accessToken: refreshedCredentials.accessToken,
              refreshToken: refreshedCredentials.refreshToken,
              expiresAt: refreshedCredentials.expiresAt,
            ),
          );

          super.accessToken = refreshedCredentials.accessToken;
        }
      }
    }

    // Merge base headers with optional overrides
    request.headers.addAll(buildHeaders(customHeaders: headers));
    return request.send();
  }

  Future<AuthCredentials?> _refreshUserToken(String refreshToken) async {
    final String endpoint = super.endpoint;
    final Map<String, dynamic> body = <String, dynamic>{
      'refresh': refreshToken,
    };

    final Map<String, String> headers = <String, String>{
      'Accept': 'application/json',
      'content-type': 'application/json',
    };

    final Response response = await _client.post(
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
