import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fullbooker/features/consumer/widgets/event_title_widget.dart';
import 'package:fullbooker/features/consumer/pages/image_preview_page.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';
import 'package:fullbooker/shared/widgets/standard_nav_bar.dart';

@RoutePage()
class GalleryPage extends StatefulWidget {
  final List<String> images;

  const GalleryPage({super.key, required this.images});

  @override
  State<StatefulWidget> createState() => GalleryPageState();
}

class GalleryPageState extends State<GalleryPage> {
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
                for (String image in mockImageUrls)
                  _buildImageTile(context, image),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageTile(BuildContext context, String imageUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<ImagePreviewPage>(
            builder: (_) {
              return ImagePreviewPage(imageUrl: imageUrl);
            },
          ),
        );
      },
      child: Hero(
        tag: imageUrl,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            placeholder: (BuildContext context, String url) => Container(
              height: 150,
              color: Colors.grey[300],
              child: const Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (BuildContext context, String url, Object error) =>
                const Icon(Icons.broken_image, size: 50),
          ),
        ),
      ),
    );
  }
}
