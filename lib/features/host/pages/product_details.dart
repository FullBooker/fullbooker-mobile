import 'package:flutter/material.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/categories.dart';
import 'package:fullbooker/features/host/pages/category_selection.dart';
import 'package:fullbooker/features/host/pages/location_selection.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';

class ProductDetails extends StatefulWidget {
  final SubCategory category;
  final ProductTypes productType;
  const ProductDetails(this.category, {super.key, required this.productType});

  @override
  State<StatefulWidget> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var nameController = TextEditingController();
  bool nameValid = true;
  var descriptionController = TextEditingController();
  bool descriptionValid = true;
  bool isLoading = false;
  var productController = ProductViewModel();

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
            descriptionController.text.isEmpty
                ? null
                : descriptionController.text,
            widget.category.id)
        .then((product) {
      if (product == null) {
        setState(() {
          isLoading = false;
        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) =>
                  LocationSelection(product, productType: widget.productType)));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const ProductSetupNavBar(step: ProductSteps.Products),
      body: Column(children: [
        Expanded(
            child: ListView(children: [
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: PageHeader("Tell us about your product", "",
                withLogo: false,
                widthFactor: 0.9,
                pageDescriptionPadding: 0,
                headerTopPadding: 0,
                pageTitleBottomPadding: 0,
                pageDescriptionFontSize: 13),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "${widget.productType.name} Name",
                    errorText: nameValid ? null : "Name cannot be empty")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: TextField(
                controller: descriptionController,
                maxLines: null,
                decoration: InputDecoration(
                    hintText:
                        "Provide any other details about this ${widget.productType.name}")),
          )
        ])),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width / 8, vertical: 30),
              child: Button(onContinueClick,
                  actionLabel: "Continue", loading: isLoading),
            ))
      ]),
    );
  }
}
