import 'package:flutter/material.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/features/host/models/sub_category_model.dart';
import 'package:fullbooker/features/host/pages/location_selection_page.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';

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
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).push(
            MaterialPageRoute<LocationSelectionPage>(
              builder: (_) => LocationSelectionPage(
                product,
                productType: widget.productType,
              ),
            ),
          );
        });
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
                      'Tell us about your product',
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
                        hintText: '${widget.productType.name} Name',
                        errorText: nameValid ? null : 'Name cannot be empty',
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
                            'Provide any other details about this ${widget.productType.name}',
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
                child: Button(
                  onContinueClick,
                  actionLabel: 'Continue',
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
