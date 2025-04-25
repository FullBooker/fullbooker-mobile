import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/old_product.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/old_buttons.dart';
import 'package:fullbooker/shared/widgets/card.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class VideoSelectionPage extends StatefulWidget {
  final OldProduct product;
  final ProductTypes type;

  const VideoSelectionPage({
    super.key,
    required this.product,
    required this.type,
  });

  @override
  State<StatefulWidget> createState() => _VideoSelectionPageState();
}

class _VideoSelectionPageState extends State<VideoSelectionPage> {
  final List<VideoPlayerController> _controllers = <VideoPlayerController>[];
  List<File> videos = <File>[];
  int filesLoaded = 0;
  bool isLoading = false;
  ProductController productViewModel = ProductController();

  Future<void> selectVideo() async {
    final FilePickerResult? result =
        await pickMediaFiles(type: UploadMediaType.VIDEO);

    if (result != null) {
      setState(() {
        filesLoaded = 0;
        videos = result.paths.map((String? path) => File(path!)).toList();
      });
    }
  }

  Future<void> replaceVideo(int currentVideoIndex) async {
    final FilePickerResult? result =
        await pickMediaFiles(type: UploadMediaType.VIDEO);

    if (result != null) {
      videos[currentVideoIndex] = File(result.paths[0]!);
      setState(() => videos = videos);
    }
  }

  Future<void> selectSingleVideo() async {
    final FilePickerResult? result =
        await pickMediaFiles(type: UploadMediaType.VIDEO);

    if (result != null) {
      videos.add(File(result.paths[0]!));
      setState(() => videos = videos);
    }
  }

  void removeVideo(int currentVideoIndex) {
    videos.removeAt(currentVideoIndex);
    setState(() => videos = videos);
  }

  void onContinueClick() {
    if (videos.length != 2) {
      showSnackBar(selectVideosAlert, context);
    }
    setState(() => isLoading = true);
    productViewModel
        .createMedia(videos, widget.product.id, 'video')
        .then((Map<String, Object?>? media) {
      setState(() => isLoading = false);
      if (media != null) {
        switch (widget.type) {
          case ProductTypes.Event:
            context.router.push(EventCategoryRoute(product: widget.product));
            break;
          case ProductTypes.Activity:
            context.router.push(ActivityPricingRoute(product: widget.product));
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const ProductSetupNavBar(step: ProductSteps.Products),
      bottomNavigationBar: const OldBottomNavBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                const PageHeader(
                  uploadVideosOfActivity,
                  '',
                  withLogo: false,
                  widthFactor: 0.9,
                  pageDescriptionPadding: 0,
                  pageTitleBottomPadding: 10,
                  pageDescriptionTopPadding: 0,
                  pageDescriptionFontSize: 0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: List<Widget>.generate(
                        videos.isEmpty && videos.length >= 2
                            ? videos.length
                            : 2, (int idx) {
                      if (idx >= videos.length) {
                        return GestureDetector(
                          onTap: selectSingleVideo,
                          child: SizedBox(
                            height: 180,
                            width: width * 0.9,
                            child: const Image(
                              image: AssetImage(imageZeroStatePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else {
                        final VideoPlayerController controller =
                            VideoPlayerController.file(videos[idx])
                              ..initialize().then((_) {
                                if (filesLoaded < idx + 1) {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    setState(() => filesLoaded = idx + 1);
                                  });
                                }
                              });
                        if (_controllers.length - 1 >= idx) {
                          _controllers[idx].dispose();
                          _controllers[idx] = controller;
                        } else {
                          _controllers.add(controller);
                        }
                        return SizedBox(
                          height: 180,
                          width: width * 0.9,
                          child: Stack(
                            children: <Widget>[
                              SizedBox(
                                height: 180,
                                width: width * 0.9,
                                child: AspectRatio(
                                  aspectRatio: (width * 0.9) / 180,
                                  child: VideoPlayer(_controllers[idx]),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SizedBox(
                                    width: width * 0.4,
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: (width - 32) * 0.25,
                                          height: 22,
                                          child: OldButton(
                                            () => replaceVideo(idx),
                                            actionLabel: replaceString,
                                            labelFontSize: 13,
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withValues(alpha: .1),
                                            actionLabelColor: Colors.black,
                                            verticalPadding: 0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: (width - 32) * 0.15,
                                          height: 22,
                                          child: OldButton(
                                            () => removeVideo(idx),
                                            // TODO(abiud): replace this with an icon
                                            actionLabel: 'X',
                                            labelFontSize: 13,
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withValues(alpha: .1),
                                            actionLabelColor: Colors.black,
                                            verticalPadding: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CustomCard(
                    child: Column(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(selectVideoCopy),
                        ),
                        SizedBox(
                          width: 160,
                          height: 50,
                          child: OldButton(
                            selectVideo,
                            actionLabel: browseString,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width / 8, vertical: 30),
              child: OldButton(
                onContinueClick,
                actionLabel: continueString,
                loading: isLoading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
