import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/features/host/pages/activity_pricing.dart';
import 'package:fullbooker/features/host/pages/category_selection.dart';
import 'package:fullbooker/features/host/pages/event_category.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/card.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:video_player/video_player.dart';

class VideoSelection extends StatefulWidget {
  final Product product;
  final ProductTypes type;

  const VideoSelection({super.key, required this.product, required this.type});

  @override
  State<StatefulWidget> createState() => _VideoSelectionState();
}

class _VideoSelectionState extends State<VideoSelection> {
  final List<VideoPlayerController> _controllers = [];
  List<File> videos = [];
  int filesLoaded = 0;
  bool isLoading = false;
  ProductViewModel productViewModel = ProductViewModel();

  void selectVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true, type: FileType.custom, allowedExtensions: ['mp4']);
    if (result != null) {
      setState(() {
        filesLoaded = 0;
        videos = result.paths.map((path) => File(path!)).toList();
      });
    }
  }

  void replaceVideo(int currentVideoIndex) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['mp4']);
    if (result != null) {
      videos[currentVideoIndex] = File(result.paths[0]!);
      setState(() => videos = videos);
    }
  }

  void selectSingleVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['mp4']);
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
      showSnackBar("Please select at least 2 videos", context);
    }
    setState(() => isLoading = true);
    productViewModel
        .createMedia(videos, widget.product.id, "video")
        .then((media) {
      setState(() => isLoading = false);
      if (media != null) {
        switch (widget.type) {
          case ProductTypes.Event:
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => EventCategory(product: widget.product)));
            });
            break;
          case ProductTypes.Activity:
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ActivityPricing(product: widget.product)));
            });
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: const ProductSetupNavBar(step: ProductSteps.Products),
        bottomNavigationBar: const BottomNavBar(),
        body: Column(children: [
          Expanded(
              child: ListView(shrinkWrap: true, children: [
            const PageHeader("Upload videos of the activity", "",
                withLogo: false,
                widthFactor: 0.9,
                pageDescriptionPadding: 0,
                headerTopPadding: 10,
                pageTitleBottomPadding: 10,
                pageHeaderFontSize: 16,
                pageDescriptionTopPadding: 0,
                pageDescriptionFontSize: 0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: List.generate(
                      videos.isEmpty && videos.length >= 2 ? videos.length : 2,
                      (idx) {
                    if (idx >= videos.length) {
                      return GestureDetector(
                        onTap: selectSingleVideo,
                        child: SizedBox(
                            height: 180,
                            width: width * 0.9,
                            child: const Image(
                                image: AssetImage("assets/defaultImg.png"),
                                fit: BoxFit.cover)),
                      );
                    } else {
                      var controller = VideoPlayerController.file(videos[idx])
                        ..initialize().then((_) {
                          if (filesLoaded < idx + 1) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
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
                        child: Stack(children: [
                          SizedBox(
                              height: 180,
                              width: width * 0.9,
                              child: AspectRatio(
                                  aspectRatio: (width * 0.9) / 180,
                                  child: VideoPlayer(_controllers[idx]))),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                width: width * 0.4,
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width: (width - 32) * 0.25,
                                        height: 22,
                                        child: Button(() => replaceVideo(idx),
                                            actionLabel: "Replace",
                                            labelFontSize: 13,
                                            color: const Color(0xf0FCF2EB),
                                            actionLabelColor: Colors.black,
                                            verticalPadding: 0)),
                                    SizedBox(
                                        width: (width - 32) * 0.15,
                                        height: 22,
                                        child: Button(() => removeVideo(idx),
                                            actionLabel: "X",
                                            labelFontSize: 13,
                                            color: const Color(0xf0FCF2EB),
                                            actionLabelColor: Colors.black,
                                            verticalPadding: 0))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]),
                      );
                    }
                  })),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomCard(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Tap below to select video"),
                    ),
                    SizedBox(
                      width: 160,
                      height: 50,
                      child: Button(
                        selectVideo,
                        actionLabel: "Browse",
                        color: const Color(0xf0333333),
                      ),
                    )
                  ],
                ),
              ),
            )
          ])),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: width / 8, vertical: 30),
                child: Button(onContinueClick,
                    actionLabel: "Continue", loading: isLoading),
              ))
        ]));
  }
}
