import 'package:flutter/material.dart';
import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_products_action.dart';
import 'package:fullbooker/application/redux/actions/update_product_search_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/products_page_view_model.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:heroicons/heroicons.dart';

class SearchProductsInput extends StatefulWidget {
  const SearchProductsInput({super.key});

  @override
  State<SearchProductsInput> createState() => _SearchProductsInputState();
}

class _SearchProductsInputState extends State<SearchProductsInput> {
  late final TextEditingController _controller;
  Timer? _debounce;
  String _searchQuery = '';

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void _onSearchChanged(String query) {
    _debounce?.cancel();

    setState(() => _searchQuery = query);

    context.dispatch(
      UpdateProductSearchAction(searchParam: query, isSearching: true),
    );

    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      if (_searchQuery.length >= 2) {
        await context.dispatch(
          FetchProductsAction(
            searchParam: _searchQuery,
            client: AppWrapperBase.of(context)!.customClient,
            onDone: () {
              context.dispatch(UpdateProductSearchAction(isSearching: false));
            },
          ),
        );
        context.dispatch(UpdateProductSearchAction(isSearching: false));
      } else {
        return;
      }
      FocusScope.of(context).unfocus();
    });
  }

  void _clearSearch() {
    _controller.clear();
    _debounce?.cancel();
    setState(() => _searchQuery = '');
    context.dispatch(
      UpdateProductSearchAction(
        searchParam: '',
        isSearching: false,
      ),
    );
    context.dispatch(
      FetchProductsAction(
        client: AppWrapperBase.of(context)!.customClient,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductsPageViewModel>(
      converter: (Store<AppState> store) =>
          ProductsPageViewModel.fromState(store.state),
      builder: (BuildContext context, ProductsPageViewModel vm) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: <Widget>[
            CustomTextInput(
              hintText: searchProducts,
              controller: _controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: _onSearchChanged,
              keyboardType: TextInputType.text,
              prefixIconData: HeroIcons.magnifyingGlass,
              suffixIconData:
                  _searchQuery.isNotEmpty ? HeroIcons.xCircle : null,
              suffixIconFunc: _clearSearch,
            ),
            if (!vm.isSearching &&
                vm.searchParam.isNotEmpty &&
                vm.searchParam != UNKNOWN)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: <InlineSpan>[
                      TextSpan(text: showingResults),
                      TextSpan(
                        text: vm.searchParam,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
