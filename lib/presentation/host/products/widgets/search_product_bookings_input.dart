import 'package:flutter/material.dart';
import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_bookings_action.dart';
import 'package:fullbooker/application/redux/actions/update_search_filters_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_search_view_model.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:heroicons/heroicons.dart';

class SearchProductBookingsInput extends StatefulWidget {
  const SearchProductBookingsInput({super.key});

  @override
  State<SearchProductBookingsInput> createState() =>
      _SearchProductBookingsInputState();
}

class _SearchProductBookingsInputState
    extends State<SearchProductBookingsInput> {
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
      UpdateSearchFiltersAction(
        productBookingSearchParam: query,
        isSearchingProductBooking: true,
      ),
    );

    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      if (_searchQuery.length >= 2) {
        await context.dispatch(
          FetchProductBookingsAction(
            searchParam: _searchQuery,
            client: AppWrapperBase.of(context)!.customClient,
            onDone: () {
              context.dispatch(
                UpdateSearchFiltersAction(isSearchingProductBooking: false),
              );
            },
          ),
        );
        context.dispatch(
          UpdateSearchFiltersAction(isSearchingProductBooking: false),
        );
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
      UpdateSearchFiltersAction(
        productBookingSearchParam: '',
        isSearchingProductBooking: false,
      ),
    );
    context.dispatch(
      FetchProductBookingsAction(
        client: AppWrapperBase.of(context)!.customClient,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductSearchViewModel>(
      converter: (Store<AppState> store) =>
          ProductSearchViewModel.fromState(store.state),
      builder: (BuildContext context, ProductSearchViewModel vm) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: <Widget>[
            CustomTextInput(
              hintText: searchBookingsHint,
              controller: _controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: _onSearchChanged,
              keyboardType: TextInputType.text,
              prefixIconData: HeroIcons.magnifyingGlass,
              suffixIconData:
                  _searchQuery.isNotEmpty ? HeroIcons.xCircle : null,
              suffixIconFunc: _clearSearch,
            ),
            if (!vm.isSearchingProductBooking &&
                vm.productBookingSearchParam.isNotEmpty &&
                vm.productBookingSearchParam != UNKNOWN)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: <InlineSpan>[
                      TextSpan(text: showingResults),
                      TextSpan(
                        text: vm.productBookingSearchParam,
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
