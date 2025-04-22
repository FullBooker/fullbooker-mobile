import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_auth_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/auth_credentials.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:http/http.dart';

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

  final bool authenticated;
  final BuildContext context;
  final Map<String, String>? headers;
  final String refreshToken;
  final String refreshTokenEndpoint;

  final Client _client;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    if (authenticated) {
      final AppState store = StoreProvider.state<AppState>(context);
      final AuthCredentials? credentials = store.authState?.authCredentials;
      final String? expiry = credentials?.expiresAt;

      final DateTime expiryDate = expiry != null
          ? DateTime.tryParse(expiry) ?? DateTime.now()
          : DateTime.now();

      final bool shouldRefreshToken =
          (credentials?.accessToken?.isEmpty ?? true) ||
              hasTokenExpired(expiryDate, DateTime.now());

      if (shouldRefreshToken &&
          (credentials?.refreshToken?.isNotEmpty ?? false)) {
        final AuthCredentials? refreshedCredentials =
            await _refreshUserToken(credentials!.refreshToken!);
        if (refreshedCredentials != null) {
          StoreProvider.dispatch<AppState>(
            context,
            UpdateAuthStateAction(
              accessToken: refreshedCredentials.accessToken,
              refreshToken: refreshedCredentials.refreshToken,
              expiresAt: refreshedCredentials.expiresAt,
            ),
          );

          super.accessToken = refreshedCredentials.accessToken!;
        }
      }
    }

    request.headers.addAll(
      buildHeaders(customHeaders: headers),
    );

    return request.send();
  }

  Future<AuthCredentials?> _refreshUserToken(String refreshToken) async {
    final Map<String, dynamic> body = <String, dynamic>{
      'refresh': refreshToken,
    };

    final Map<String, String> requestHeaders = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final Response response = await _client.post(
      Uri.parse(refreshTokenEndpoint),
      headers: requestHeaders,
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
