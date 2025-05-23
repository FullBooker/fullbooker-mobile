import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/features/consumer/widgets/event_title_widget.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/standard_nav_bar.dart';

@RoutePage()
class ImageGalleryPage extends StatefulWidget {
  final List<String> images;

  const ImageGalleryPage({super.key, required this.images});

  @override
  State<StatefulWidget> createState() => ImageGalleryPageState();
}

class ImageGalleryPageState extends State<ImageGalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:
          const StandardNavBar(showSearchBar: false, showRightAction: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: EventTitleWidget(),
            ),
            StaggeredGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: <Widget>[
                for (String url in mockImageUrls)
                  GestureDetector(
                    onTap: () => context.router.push(
                      ImagePreviewRoute(
                        imageUrl: url,
                        imageUrls: mockImageUrls,
                      ),
                    ),
                    child: Hero(
                      tag: url,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: url,
                          fit: BoxFit.cover,
                          errorWidget: (
                            BuildContext context,
                            String url,
                            Object error,
                          ) =>
                              Image.asset(
                            productImageZeroState,
                            height: MediaQuery.of(context).size.height * .2,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          progressIndicatorBuilder: (
                            BuildContext context,
                            String url,
                            DownloadProgress progress,
                          ) =>
                              Center(child: AppLoading()),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
