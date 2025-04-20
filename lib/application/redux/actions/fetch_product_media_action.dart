import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/application/redux/actions/update_current_product_action.dart';
import 'package:fullbooker/application/redux/actions/update_selected_product_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/entities/product_media_response.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class FetchProductMediaAction extends ReduxAction<AppState> {
  FetchProductMediaAction({
    this.onSuccess,
    this.onError,
    required this.client,
    required this.workflowState,
  });

  final Function(String error)? onError;
  final Function()? onSuccess;
  final ICustomClient client;
  final WorkflowState workflowState;

  @override
  Future<AppState?> reduce() async {
    final String? productId = workflowState == WorkflowState.CREATE
        ? state.hostState?.currentProduct?.id
        : state.hostState?.selectedProduct?.id;

    final Uri uri = Uri.parse(GetIt.I.get<AppConfig>().productMediaEndpoint);
    final Response httpResponse = await client.callRESTAPI(
      endpoint: uri.toString(),
      method: APIMethods.GET.name,
      queryParams: <String, dynamic>{'product_id': productId},
    );

    if (httpResponse.statusCode >= 400) {
      final Map<String, dynamic>? body =
          json.decode(httpResponse.body) as Map<String, dynamic>?;

      final String? error = client.parseError(body);

      onError?.call(error ?? defaultUserFriendlyMessage);

      return null;
    }

    final Map<String, dynamic> jsonBody =
        json.decode(httpResponse.body) as Map<String, dynamic>;

    final ProductMediaResponse mediaResponse =
        ProductMediaResponse.fromJson(jsonBody);

    final List<ProductMedia?> mediaList =
        mediaResponse.results ?? <ProductMedia?>[];

    final List<ProductMedia?> photos = mediaList
        .where((ProductMedia? m) => m?.mediaType == kImageMediaType)
        .toList();
    final List<ProductMedia?> videos = mediaList
        .where((ProductMedia? m) => m?.mediaType == kVideoMediaType)
        .toList();

    if (workflowState == WorkflowState.CREATE) {
      dispatch(UpdateCurrentProductAction(photos: photos, videos: videos));
    } else {
      dispatch(UpdateSelectedProductAction(photos: photos, videos: videos));
    }

    onSuccess?.call();
    return null;
  }
}
