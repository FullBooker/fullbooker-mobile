import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/host_state.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class RemoveProductMediaAction extends ReduxAction<AppState> {
  final ProductMedia image;

  RemoveProductMediaAction(this.image);

  @override
  Future<AppState?> reduce() async {
    final String endpoint = GetIt.I.get<AppConfig>().productMediaEndpoint;

    await http.delete(
      Uri.parse(endpoint),
      body: <String, String>{'id': image.id ?? ''},
    );

    final List<ProductMedia> updated = <ProductMedia>[
      ...(state.hostState?.draftProductMedia ?? <ProductMedia>[]),
    ]..remove(image);

    final HostState? updatedHost =
        state.hostState?.copyWith(draftProductMedia: updated);

    return state.copyWith(hostState: updatedHost);
  }
}
