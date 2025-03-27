import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).dividerColor,
        ),
      ),
      child: Row(
        children: <Widget>[
          if (iconSVGPath != null)
            SvgPicture.asset(
              iconSVGPath!,
              width: MediaQuery.of(context).size.width / 2,
            ),
          Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : AppColors.textBlackColor,
                    ),
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
