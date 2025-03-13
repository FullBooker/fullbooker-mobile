import 'package:flutter/material.dart';
import 'package:fullbooker/features/host/controllers/category_controller.dart';
import 'package:fullbooker/features/host/pages/product_details.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:fullbooker/shared/widgets/titled_dropdown.dart';
import 'package:fullbooker/features/host/models/categories.dart';

// ignore: constant_identifier_names
enum ProductTypes { Event, Activity }

class CategorySelection extends StatefulWidget {
  const CategorySelection({super.key});

  @override
  State<StatefulWidget> createState() => CategorySelectionState();
}

class CategorySelectionState extends State<CategorySelection> {
  List<Category> categories = <Category>[];
  CategoryViewModel categoryController = CategoryViewModel();
  bool isLoading = true;
  SubCategory? selectedSubCat;
  Category? selectedSubCatParent;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => fetchCategories());
  }

  void fetchCategories() {
    categoryController.repository
        .pullMultiple(1, 100)
        .then((List<Category> categories_) {
      setState(() {
        categories = categories_;
        isLoading = false;
      });
    });
  }

  void onContinueClick() {
    if (selectedSubCat == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a category for your event'),
        ),
      );
    }
    Navigator.of(context).push(
      MaterialPageRoute<ProductDetails>(
        builder: (_) {
          final ProductTypes type =
              _mapCategoryToType(selectedSubCatParent!.title);
          return ProductDetails(selectedSubCat!, productType: type);
        },
      ),
    );
  }

  void optionSelected(SubCategory subCat, Category subCatParent) {
    final ProductTypes type = _mapCategoryToType(subCatParent.title);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(
        MaterialPageRoute<ProductDetails>(
          builder: (_) => ProductDetails(subCat, productType: type),
        ),
      );
    });
  }

  ProductTypes _mapCategoryToType(String categoryName) {
    final Map<String, ProductTypes> map = <String, ProductTypes>{
      'Activities': ProductTypes.Activity,
      'Events': ProductTypes.Event,
    };
    return map[categoryName]!;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const ProductSetupNavBar(step: ProductSteps.Products),
      bottomNavigationBar: const BottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        const PageHeader(
                          'Tell us about your product',
                          '',
                          withLogo: false,
                          widthFactor: 0.9,
                          pageDescriptionPadding: 0,
                          headerTopPadding: 15,
                          pageTitleBottomPadding: 10,
                          pageHeaderFontSize: 17,
                          pageDescriptionFontSize: 0,
                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Pick the one that best describes your product',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        for (Category category in categories)
                          category.subcategories.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 13,
                                    horizontal: 25,
                                  ),
                                  child: TitledDropdown(
                                    title: category.title,
                                    options: category.subcategories
                                        .map((SubCategory subCat) {
                                      return DropDownOption(
                                        subCat.name,
                                        subCat.id,
                                        () => optionSelected(subCat, category),
                                      );
                                    }).toList(),
                                  ),
                                )
                              : const SizedBox(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width / 8,
                        vertical: 30,
                      ),
                      child: Button(onContinueClick, actionLabel: 'Continue'),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
