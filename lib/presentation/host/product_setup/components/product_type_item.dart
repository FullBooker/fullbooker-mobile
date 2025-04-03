import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fullbooker/core/theme/app_colors.dart';

class ProductTypeItem extends StatelessWidget {
  const ProductTypeItem({
    super.key,
    required this.title,
    required this.description,
    this.isSelected = false,
    this.iconSVGPath,
  });

  final String title;
  final String description;
  final bool isSelected;
  final String? iconSVGPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).dividerColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (iconSVGPath != null)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: SvgPicture.asset(
                iconSVGPath!,
                width: 48,
                height: 48,
              ),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : AppColors.textBlackColor,
                      ),
                ),
                if (description.isNotEmpty)
                  Text(
                    description,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
