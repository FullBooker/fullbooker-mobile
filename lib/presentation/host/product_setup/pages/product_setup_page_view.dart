import 'dart:math';

import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/host/product_setup/pages/product_basic_details_page.dart';
import 'package:fullbooker/presentation/host/product_setup/pages/product_category_page.dart';
import 'package:fullbooker/presentation/host/product_setup/pages/product_sub_category_page.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';

@RoutePage()
class ProductSetupPageView extends StatefulWidget {
  const ProductSetupPageView({super.key});

  @override
  State<ProductSetupPageView> createState() => _ProductSetupPageViewState();
}

class _ProductSetupPageViewState extends State<ProductSetupPageView> {
  late final PageController _controller;
  late ProductSetupStep _currentStep;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final Product? product =
          context.getState<AppState>().hostState?.selectedProduct;

      _currentStep = detectCurrentStep(product);
      _controller = PageController(initialPage: _currentStep.index);
    });

    super.initState();
  }

  void _goToStep(ProductSetupStep step) {
    setState(() {
      _controller.animateToPage(
        step.index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onNext() {
    final int nextIndex =
        min(ProductSetupStep.values.length - 1, _currentStep.index + 1);
    _goToStep(ProductSetupStep.values[nextIndex]);
  }

  void _onBack() {
    final int prevIndex = max(0, _currentStep.index - 1);
    _goToStep(ProductSetupStep.values[prevIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            // Steps header
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: ProductSetupStep.values.map(
                  (ProductSetupStep step) {
                    final bool isActive = step == _currentStep;

                    return Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            stepLabels[step]!,
                            style: TextStyle(
                              fontWeight: isActive
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isActive
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                            ),
                          ),
                          if (isActive)
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              height: 2,
                              color: Theme.of(context).primaryColor,
                              width: 24,
                            ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            ),

            // Main content area with page views
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (int i) {
                  setState(() {
                    _currentStep = ProductSetupStep.values[i];
                  });
                },
                children: const <Widget>[
                  ProductCategoryPage(),
                  ProductSubCategoryPage(),
                  ProductBasicDetailsPage(),
                ],
              ),
            ),

            // Previous and next buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                spacing: 16,
                children: <Widget>[
                  if (!(_currentStep == ProductSetupStep.category))
                    Flexible(
                      child: SecondaryButton(
                        addBorder: true,
                        onPressed: _onBack,
                        child: d.right(
                          previousString,
                        ),
                        fillColor: Colors.transparent,
                      ),
                    ),
                  if (!(_currentStep == ProductSetupStep.basic_details))
                    Flexible(
                      child: PrimaryButton(
                        onPressed: _onNext,
                        child: d.right(continueString),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
