import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/features/host/models/sub_category_model.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/old_buttons.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';

@RoutePage()
class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage(
    this.category, {
    super.key,
    required this.productType,
  });

  final SubCategory category;
  final ProductTypes productType;

  @override
  State<StatefulWidget> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  TextEditingController descriptionController = TextEditingController();
  bool descriptionValid = true;
  bool isLoading = false;
  TextEditingController nameController = TextEditingController();
  bool nameValid = true;
  ProductViewModel productController = ProductViewModel();

  void onContinueClick() {
    setState(() {
      if (nameController.text.isEmpty) {
        nameValid = false;
        return;
      }
      isLoading = true;
    });

    productController
        .createProduct(
      nameController.text,
      descriptionController.text.isEmpty ? null : descriptionController.text,
      widget.category.id,
    )
        .then((Product? product) {
      if (product == null) {
        setState(() {
          isLoading = false;
        });
      } else {
        context.router.push(
          LocationSelectionRoute(
            product: product,
            productType: widget.productType,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const ProductSetupNavBar(step: ProductSteps.Products),
      bottomNavigationBar: const BottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: PageHeader(
                      tellUsAboutProduct,
                      '',
                      withLogo: false,
                      widthFactor: 0.9,
                      pageDescriptionPadding: 0,
                      headerTopPadding: 0,
                      pageTitleBottomPadding: 10,
                      pageDescriptionFontSize: 0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: '${widget.productType.name} $nameString',
                        errorText: nameValid ? null : nameCannotBeEmpty,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    child: TextField(
                      controller: descriptionController,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText:
                            '$provideAnyOtherDetails ${widget.productType.name}',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: width / 8, vertical: 30),
                child: OldButton(
                  onContinueClick,
                  actionLabel: continueString,
                  loading: isLoading,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
