import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:heroicons/heroicons.dart';

class UploadMediaZeroState extends StatelessWidget {
  const UploadMediaZeroState({
    super.key,
    required this.onTap,
    required this.mediaType,
  });

  final Function()? onTap;
  final UploadMediaType mediaType;

  @override
  Widget build(BuildContext context) {
    final bool isPhoto = mediaType == UploadMediaType.PHOTO;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).dividerColor,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: <Widget>[
            SvgPicture.asset(addPhotosIconSVGPath),
            Row(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                HeroIcon(
                  HeroIcons.plus,
                  size: 16,
                ),
                Text(
                  isPhoto ? addPhoto : addVideo,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
