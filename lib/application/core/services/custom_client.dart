import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_auth_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/auth_credentials.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils/utils.dart';

import 'package:http/http.dart' as http;

class CustomClient extends ICustomClient {
  CustomClient({
    required this.context,
    required String accessToken,
    this.headers,
    this.authenticated = true,
    required this.refreshToken,
    required this.refreshTokenEndpoint,
  }) {
    super.accessToken = accessToken;
  }

  final bool authenticated;
  final BuildContext context;
  final Map<String, String>? headers;
  final String refreshToken;
  final String refreshTokenEndpoint;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    if (authenticated) {
      final AppState store = StoreProvider.state<AppState>(context);
      final AuthCredentials? credentials = store.authState?.authCredentials;
      final String? expiry = credentials?.expiresAt;

      final bool isSignedIn = store.authState?.isSignedIn ?? false;

      if (!isSignedIn) return request.send();

      final DateTime now = DateTime.now();

      final DateTime expiresAt =
          DateTime.tryParse(expiry ?? '')?.toLocal() ?? now;

      final bool hasExpired = hasTokenExpired(expiresAt, now);

      final bool shouldRefreshToken =
          (credentials?.accessToken?.isEmpty ?? true) ||
              credentials?.accessToken == UNKNOWN ||
              hasExpired;

      if (shouldRefreshToken) {
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

    return request.send();
  }

  Future<AuthCredentials?> _refreshUserToken(String refreshToken) async {
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
