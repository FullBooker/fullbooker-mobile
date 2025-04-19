import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';

class LimitedDescriptionWidget extends StatelessWidget {
  const LimitedDescriptionWidget({
    super.key,
    required this.name,
    required this.description,
  });

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    if (description.trim().isEmpty || description == 'UNKNOWN') {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () {
            showFullDescriptionDialog(
              context: context,
              title: name,
              description: description,
            );
          },
          child: Text(
            viewMoreString,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ],
    );
  }
}
