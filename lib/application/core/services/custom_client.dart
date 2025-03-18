import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:http/http.dart';

class CustomClient extends ICustomClient {
  CustomClient(
    String idToken,
    String endpoint,
    this.appVariant, {
    required this.context,
    // required this.refreshTokenEndpoint,
    // required this.refreshToken,
    this.headers,
    Client? client,
  }) : _client = client ?? Client() {
    super.idToken = idToken;
    super.endpoint = endpoint;
  }

  final BuildContext context;
  final Map<String, String>? headers;
  // final String refreshToken;
  // final String refreshTokenEndpoint;
  final String appVariant;

  final Client _client;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    final bool isSignedIn =
        StoreProvider.state<AppState>(context).authState?.isSignedIn ?? false;

    final String requestUrl = request.url.toString();

    // if (isSignedIn == false && requestUrl.contains('graphql')) {
    //   request.headers.addAll(<String, String>{...?headers});
    //   return request.send();
    // }

    request.headers.addAll(<String, String>{...?headers});
    final String? expiryDateString = StoreProvider.state<AppState>(context)
        .authState
        ?.authCredentials
        ?.expiresAt;

    // Safely parse the expiry date, defaulting to DateTime.now() if invalid or empty
    final DateTime expiryDateTime = ((expiryDateString?.isNotEmpty ?? false)
            ? DateTime.tryParse(expiryDateString!)
            : null) ??
        DateTime.now();

    // // Determine if the token should be refreshed
    // final bool shouldRefreshToken = isSignedIn &&
    //     (hasTokenExpired(expiryDateTime, DateTime.now()) || idToken.isEmpty);

    // // Return the request if no refresh is needed
    // if (!shouldRefreshToken) return request.send();

    // AuthCredentials? authCredentials = await refreshUserToken();

    // if (authCredentials?.idToken != null &&
    //     authCredentials?.expiresIn != null &&
    //     authCredentials?.refreshToken != null) {
    //   request.headers.addAll(<String, String>{
    //     'Authorization': 'Bearer ${authCredentials?.idToken}',
    //   });

    //   final DateTime expiryTimestamp =
    //       getTokenExpiryTimestamp(authCredentials?.expiresIn);

    //   authCredentials = authCredentials?.copyWith(
    //     tokenExpiryTimestamp: expiryTimestamp.toIso8601String(),
    //   );

    //   context.dispatch(
    //     UpdateAuthStateAction(
    //       idToken: authCredentials?.idToken,
    //       refreshToken: authCredentials?.refreshToken,
    //       expiresIn: authCredentials?.expiresIn,
    //       tokenExpiryTimestamp: authCredentials?.tokenExpiryTimestamp,
    //     ),
    //   );
    // }

    return request.send();
  }

  // Future<AuthCredentials?> refreshUserToken() async {
  //   final Map<String, dynamic> body = <String, dynamic>{
  //     'query': refreshTokenMutation,
  //     'variables': <String, String>{'refreshToken': refreshToken},
  //   };
  //   final Map<String, String> headers = <String, String>{
  //     'Accept': 'application/json',
  //     'content-type': 'application/json',
  //     'X-Variant': appVariant,
  //   };
  //   final Response refreshTokenResponse = await _client.post(
  //     Uri.parse(endpoint),
  //     headers: headers,
  //     body: json.encode(body),
  //   );

  //   AuthCredentials? credentials =
  //       StoreProvider.state<AppState>(context).authState?.authCredentials;

  //   if (refreshTokenResponse.statusCode == 200) {
  //     final Map<String, dynamic> body =
  //         jsonDecode(refreshTokenResponse.body) as Map<String, dynamic>;

  //     final AuthCredentials tempAuthCredentials =
  //         AuthCredentials.fromJson(body['data']['refreshToken']);

  //     final DateTime expiryTimestamp =
  //         getTokenExpiryTimestamp(tempAuthCredentials.expiresIn);

  //     credentials = credentials?.copyWith(
  //       refreshToken: tempAuthCredentials.refreshToken,
  //       idToken: tempAuthCredentials.idToken,
  //       expiresIn: tempAuthCredentials.expiresIn,
  //       tokenExpiryTimestamp: expiryTimestamp.toIso8601String(),
  //     );
  //   }

  //   return credentials;
  // }
}
