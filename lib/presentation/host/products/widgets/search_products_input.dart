import 'package:flutter/material.dart';
import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_products_action.dart';
import 'package:fullbooker/application/redux/actions/update_product_search_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/products_page_view_model.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:heroicons/heroicons.dart';

class SearchProductsInput extends StatefulWidget {
  const SearchProductsInput({super.key});

  @override
  State<SearchProductsInput> createState() => _SearchProductsInputState();
}

class _SearchProductsInputState extends State<SearchProductsInput> {
  late TextEditingController _controller;

  late Timer _debounce = Timer(Duration.zero, () {});

  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });

    if (_debounce.isActive) {
      _debounce.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 1500), () {
      if (_searchQuery.length >= 3) {
        context.dispatch(
          UpdateProductSearchAction(
            searchParam: _searchQuery,
            isSearching: true,
          ),
        );

        context.dispatch(
          FetchProductsAction(
            searchParam: _searchQuery,
            client: AppWrapperBase.of(context)!.customClient,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductsPageViewModel>(
      converter: (Store<AppState> store) =>
          ProductsPageViewModel.fromState(store.state),
      builder: (BuildContext context, ProductsPageViewModel vm) {
        return Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTextInput(
              hintText: searchProducts,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _controller,
              onChanged: _onSearchChanged,
              keyboardType: TextInputType.text,
              prefixIconData: HeroIcons.magnifyingGlass,
              suffixIconData:
                  _searchQuery.isNotEmpty ? HeroIcons.xCircle : null,
              suffixIconFunc: () {
                _controller.clear();
                context.dispatch(
                  UpdateProductSearchAction(
                    isSearching: false,
                  ),
                );
                context.dispatch(
                  FetchProductsAction(
                    client: AppWrapperBase.of(context)!.customClient,
                  ),
                );
                setState(() {
                  _searchQuery = '';
                });
              },
            ),
            if (vm.isSearching)
              Text(
                showingResults(vm.searchParam),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
          ],
        );
      },
    );
  }
}
