import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/old_product.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';
import 'package:fullbooker/shared/widgets/old_buttons.dart';
import 'package:fullbooker/shared/widgets/card.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';

@RoutePage()
class ImageSelectionPage extends StatefulWidget {
  const ImageSelectionPage({
    super.key,
    required this.product,
    this.type = ProductTypes.Event,
  });

  final OldProduct product;
  final ProductTypes type;

  @override
  State<StatefulWidget> createState() => _ImageSelectionPageState();
}

class _ImageSelectionPageState extends State<ImageSelectionPage> {
  List<File> images = <File>[];
  bool isLoading = false;
  ProductController productViewModel = ProductController();

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: okThanksString,
          onPressed: () {},
        ),
        content: Text(message),
        duration: const Duration(milliseconds: 5000),
        width: 340, // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0, vertical: 10, // Inner padding for SnackBar content.
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> selectImage() async {
    final FilePickerResult? result =
        await pickMediaFiles(type: UploadMediaType.PHOTO);
    if (result != null) {
      setState(() {
        images = result.paths.map((String? path) => File(path!)).toList();
      });
    }
  }

  Future<void> selectSingleImage() async {
    final FilePickerResult? result =
        await pickMediaFiles(type: UploadMediaType.PHOTO);

    if (result != null) {
      setState(() {
        images.add(File(result.paths[0]!));
        images = images;
      });
    }
  }

  Future<void> replaceImage(int currentImageIndex) async {
    final FilePickerResult? result =
        await pickMediaFiles(type: UploadMediaType.PHOTO);
    if (result != null) {
      images[currentImageIndex] = File(result.paths[0]!);
      setState(() => images = images);
    }
  }

  Future<void> removeImage(int currentImageIndex) async {
    images.removeAt(currentImageIndex);
    setState(() => images = images);
  }

  void onContinueClick() {
    if (images.length < 2) {
      showSnackBar(selectImagesAlert);
      return;
    }
    setState(() => isLoading = true);
    productViewModel
        .createMedia(images, widget.product.id, 'image')
        .then((Map<String, Object?>? media) {
      setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const ProductSetupNavBar(step: ProductSteps.Products),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                const PageHeader(
                  uploadPhotosOfActivity,
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
                        images.isNotEmpty && images.length >= 2
                            ? images.length
                            : 2, (int idx) {
                      if (idx >= images.length) {
                        return GestureDetector(
                          onTap: selectSingleImage,
                          child: SizedBox(
                            height: 160,
                            width: (width - 32) * 0.4,
                            child: const Image(
                              image: AssetImage(imageZeroStatePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: 180,
                          width: (width - 32) * 0.4,
                          child: Stack(
                            children: <Widget>[
                              SizedBox(
                                height: 180,
                                width: (width - 32) * 0.4,
                                child:
                                    Image.file(images[idx], fit: BoxFit.cover),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: (width - 32) * 0.25,
                                        height: 22,
                                        child: OldButton(
                                          () => replaceImage(idx),
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
                                          () => removeImage(idx),
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
                          child: Text(selectImageCopy),
                        ),
                        SizedBox(
                          width: 160,
                          height: 50,
                          child: OldButton(
                            selectImage,
                            actionLabel: browseString,
                            color: Theme.of(context).primaryColor,
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
