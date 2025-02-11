import 'package:flutter/material.dart';
import 'package:fullbooker/features/events/controllers/category_controller.dart';
import 'package:fullbooker/features/events/pages/product_details.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:fullbooker/shared/widgets/titled_dropdown.dart';
import 'package:fullbooker/features/events/models/categories.dart';

enum ProductTypes { Event, Activity }

class CategorySelection extends StatefulWidget {
  const CategorySelection({super.key});

  @override
  State<StatefulWidget> createState() => CategorySelectionState();
}

class CategorySelectionState extends State<CategorySelection> {
  List<Category> categories = [];
  bool isLoading = true;
  var categoryController = CategoryViewModel();
  SubCategory? selectedSubCat;
  Category? selectedSubCatParent;

  ProductTypes _mapCategoryToType(String categoryName) {
    var map = {
      "Activities": ProductTypes.Activity,
      "Events": ProductTypes.Event
    };
    return map[categoryName]!;
  }

  void fetchCategories() {
    categoryController.repository.pullMultiple(1, 100).then((categories_) {
      setState(() {
        categories = categories_;
        isLoading = false;
      });
    });
  }

  void onContinueClick() {
    if (selectedSubCat == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please select a category for your event")));
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      var type = _mapCategoryToType(selectedSubCatParent!.title);
      return ProductDetails(selectedSubCat!, productType: type);
    }));
  }

  void optionSelected(SubCategory subCat, Category subCatParent) {
    var type = _mapCategoryToType(subCatParent.title);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ProductDetails(subCat, productType: type)));
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => fetchCategories());
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const ProductSetupNavBar(step: ProductSteps.Products),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(children: [
              Expanded(
                  child: ListView(children: [
                const PageHeader("", "Tell us about your product",
                    withLogo: false,
                    widthFactor: 0.9,
                    pageDescriptionPadding: 20,
                    headerTopPadding: 0),
                const Center(
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                          "Pick the one that best describes your product")),
                ),
                for (var category in categories)
                  category.subcategories.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 25),
                          child: TitledDropdown(
                              title: category.title,
                              options: category.subcategories.map((subCat) {
                                return DropDownOption(subCat.name, subCat.id,
                                    () => optionSelected(subCat, category));
                              }).toList()))
                      : const SizedBox(),
              ])),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 8, vertical: 30),
                    child: Button(onContinueClick, actionLabel: "Continue"),
                  ))
            ]),
    );
  }
}
