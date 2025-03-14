import 'package:flutter/material.dart';
import 'package:fullbooker/features/host/models/categories.dart';
import 'package:fullbooker/shared/widgets/scale_locked_text.dart';

class CategoryWithIcon {
  Category category;
  String icon;

  CategoryWithIcon({required this.category, required this.icon});
}

class CategoryConveyerWidget extends StatefulWidget {
  final Map<String, Category> categories;
  final Function? onCategoryClick;

  const CategoryConveyerWidget({
    super.key,
    this.categories = const <String, Category>{},
    this.onCategoryClick,
  });

  @override
  State<StatefulWidget> createState() => _CategoryConveyerWidgetState();
}

class _CategoryConveyerWidgetState extends State<CategoryConveyerWidget> {
  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 100, // Scroll left by 100 pixels
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 100, // Scroll right by 100 pixels
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  List<CategoryWithIcon> getCategoriesWithIcons() {
    return widget.categories.entries.map((MapEntry<String, Category> entry) {
      return CategoryWithIcon(category: entry.value, icon: entry.key);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<CategoryWithIcon> cats = getCategoriesWithIcons();

    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 30,
            child: GestureDetector(
              onTap: _scrollLeft,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(),
                ),
                child: const Icon(Icons.arrow_back_ios_new_sharp, size: 24),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: cats.length,
              itemBuilder: (BuildContext context, int index) {
                final CategoryWithIcon category = cats[index];
                return GestureDetector(
                  onTap: () => widget.onCategoryClick?.call(category),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(category.icon),
                        ),
                        ScaleLockedText(
                          category.category.title,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: 30,
            child: GestureDetector(
              onTap: _scrollRight,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(),
                ),
                child: const Icon(Icons.arrow_forward_ios, size: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
