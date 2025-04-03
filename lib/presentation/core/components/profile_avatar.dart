import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.avatarURI,
    required this.displayName,
    this.aviSize = 50,
  });

  final String? avatarURI;
  final String? displayName;
  final double aviSize;

  @override
  Widget build(BuildContext context) {
    final bool emptyAvi = avatarURI == null ||
        (avatarURI?.isEmpty ?? true) ||
        avatarURI == UNKNOWN;

    if (!emptyAvi) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(aviSize),
        child: CachedNetworkImage(
          height: aviSize,
          width: aviSize,
          fit: BoxFit.cover,
          imageUrl: avatarURI!,
          progressIndicatorBuilder: (
            BuildContext context,
            String url,
            DownloadProgress progress,
          ) =>
              Center(child: AppLoading()),
        ),
      );
    } else {
      return Container(
        height: aviSize,
        width: aviSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
        ),
        child: Center(
          child: Text(
            getInitials(displayName ?? noName).toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      );
    }
  }
}
