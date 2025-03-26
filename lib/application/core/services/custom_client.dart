import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:http/http.dart';

class CustomClient extends ICustomClient {
  CustomClient({
    required this.context,
    required String accessToken,
    this.headers,
    this.authenticated = true,
    required this.refreshToken,
    required this.refreshTokenEndpoint,
    // Client? client,
  })
  // : _client = client ?? Client()

  {
    super.accessToken = accessToken;
  }

  final bool authenticated;
  final BuildContext context;
  final Map<String, String>? headers;
  final String refreshToken;
  final String refreshTokenEndpoint;

  // final Client _client;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    // Skip auth check for unauthenticated requests

    // TODO(abiud): reenable refresh token checks once the API has been implemented
    // if (authenticated) {
    // final AppState store = StoreProvider.state<AppState>(context);
    // final AuthCredentials? credentials = store.authState?.authCredentials;
    // final String? expiry = credentials?.expiresAt;

    // final DateTime expiryDate = expiry != null
    //     ? DateTime.tryParse(expiry) ?? DateTime.now()
    //     : DateTime.now();

    // final bool shouldRefreshToken =
    //     (credentials?.accessToken.isEmpty ?? true) ||
    //         hasTokenExpired(expiryDate, DateTime.now());

    // if (shouldRefreshToken &&
    //     (credentials?.refreshToken.isNotEmpty ?? false)) {
    //   final AuthCredentials? refreshedCredentials =
    //       await _refreshUserToken(credentials!.refreshToken);
    //   if (refreshedCredentials != null) {
    //     StoreProvider.dispatch<AppState>(
    //       context,
    //       UpdateAuthStateAction(
    //         accessToken: refreshedCredentials.accessToken,
    //         refreshToken: refreshedCredentials.refreshToken,
    //         expiresAt: refreshedCredentials.expiresAt,
    //       ),
    //     );

    //     super.accessToken = refreshedCredentials.accessToken;
    //   }
    // }
    // }

    // Merge base headers with optional overrides
    // request.headers.addAll(
    //   buildHeaders(customHeaders: headers),
    // );

    return request.send();
  }

  // TODO(abiud): restore this once the refresh token API is complete
  // Future<AuthCredentials?> _refreshUserToken(String refreshToken) async {
  //   final String endpoint = super.endpoint;
  //   final Map<String, dynamic> body = <String, dynamic>{
  //     'refresh': refreshToken,
  //   };

  //   final Map<String, String> headers = <String, String>{
  //     'Accept': 'application/json',
  //     'content-type': 'application/json',
  //   };

  //   final Response response = await _client.post(
  //     Uri.parse(endpoint),
  //     headers: headers,
  //     body: json.encode(body),
  //   );

  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> data =
  //         jsonDecode(response.body) as Map<String, dynamic>;

  //     return AuthCredentials.fromJson(data);
  //   }

  //   return null;
  // }
}
