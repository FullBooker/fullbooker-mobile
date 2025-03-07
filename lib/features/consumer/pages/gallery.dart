import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fullbooker/features/consumer/widgets/event_title.dart';
import 'package:fullbooker/features/consumer/widgets/full_screen_image.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';

class Gallery extends StatefulWidget {
  final List<String> images;

  const Gallery({super.key, required this.images});

  @override
  State<StatefulWidget> createState() => GalleryState();
}

class GalleryState extends State<Gallery> {
  final List<String> imageUrls = [
    "https://i.imgur.com/KBicWbe.png",
    "https://i.imgur.com/QoUtaJz.png",
    "https://i.imgur.com/dCBshIt.png",
    "https://i.imgur.com/aGE2yAR.png",
    "https://i.imgur.com/ooAxO9f.png",
    "https://i.imgur.com/O6Zd54G.png",
    "https://i.imgur.com/mAmy0jb.png",
    "https://i.imgur.com/tRmwlQw.png",
    "https://i.imgur.com/XK4RGag.png",
    "https://i.imgur.com/ZpJwjtd.png",
    "https://i.imgur.com/dnrQX0i.png",
    "https://i.imgur.com/wVU5Evt.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:
          const StandardNavBar(showSearchBar: false, showRightAction: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: EventTitleSection(),
            ),
            StaggeredGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: [
                for (var image in imageUrls) _buildImageTile(context, image)
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
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return FullScreenImageView(imageUrl: imageUrl);
        }));
      },
      child: Hero(
        tag: imageUrl,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              height: 150,
              color: Colors.grey[300],
              child: const Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.broken_image, size: 50),
          ),
        ),
      ),
    );
  }
}
