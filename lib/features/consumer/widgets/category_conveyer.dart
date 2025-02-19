import 'package:flutter/material.dart';
import 'package:fullbooker/features/host/models/categories.dart';

class CategoryConveyer extends StatefulWidget {
  final List<Category> categories;
  final Function? onCategoryClick;

  const CategoryConveyer(
      {super.key, this.categories = const [], this.onCategoryClick});

  @override
  State<StatefulWidget> createState() => _CategoryConveyerState();
}

class _CategoryConveyerState extends State<CategoryConveyer> {
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: _scrollLeft,
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.categories.length,
              itemBuilder: (context, index) {
                final category = widget.categories[index];
                return GestureDetector(
                  onTap: () => widget.onCategoryClick?.call(category),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child:
                              const Icon(Icons.category, color: Colors.black54),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          category.title,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: _scrollRight,
          ),
        ],
      ),
    );
  }
}
