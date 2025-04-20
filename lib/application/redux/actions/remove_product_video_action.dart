import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_current_product_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class RemoveProductVideoAction extends ReduxAction<AppState> {
  RemoveProductVideoAction({
    required this.video,
    required this.client,
    this.onError,
  });

  final Function(String error)? onError;
  final ICustomClient client;
  final ProductMedia video;

  @override
  Future<AppState?> reduce() async {
    final String endpoint =
        '${GetIt.I.get<AppConfig>().productMediaEndpoint}${video.id}/';

    final Response httpResponse = await client.callRESTAPI(
      endpoint: endpoint,
      method: APIMethods.DELETE.name.toUpperCase(),
    );

    if (httpResponse.statusCode >= 400) {
      final Map<String, dynamic> body =
          json.decode(httpResponse.body) as Map<String, dynamic>;

      final String? error = client.parseError(body);

      onError?.call(error ?? defaultUserFriendlyMessage);
      return null;
    }

    final List<ProductMedia> currentVideos = state
            .hostState?.currentProduct?.videos
            ?.whereType<ProductMedia>()
            .toList() ??
        <ProductMedia>[];

    final List<ProductMedia> updatedVideos = currentVideos
      ..removeWhere((ProductMedia item) => item.id == video.id);

    dispatch(UpdateCurrentProductAction(videos: updatedVideos));

    return state;
  }
}
