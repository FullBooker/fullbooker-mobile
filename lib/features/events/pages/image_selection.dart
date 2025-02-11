import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/features/events/controllers/product_controller.dart';
import 'package:fullbooker/features/events/models/product.dart';
import 'package:fullbooker/features/events/pages/category_selection.dart';
import 'package:fullbooker/features/events/pages/video_selection.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/card.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';

class ImageSelection extends StatefulWidget {
  final Product product;
  final ProductTypes type;

  const ImageSelection(
      {super.key, required this.product, this.type = ProductTypes.Event});

  @override
  State<StatefulWidget> createState() => _ImageSelectionState();
}

class _ImageSelectionState extends State<ImageSelection> {
  List<File> images = [];
  ProductViewModel productViewModel = ProductViewModel();
  bool isLoading = false;

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            // Code to execute.
          },
        ),
        content: Text(message),
        duration: const Duration(milliseconds: 5000),
        width: 340, // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
            horizontal: 8.0, vertical: 10 // Inner padding for SnackBar content.
            ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  void selectImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png']);
    if (result != null) {
      setState(() {
        images = result.paths.map((path) => File(path!)).toList();
      });
    }
  }

  void selectSingleImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png']);
    if (result != null) {
      setState(() {
        images.add(File(result.paths[0]!));
        images = images;
      });
    }
  }

  void replaceImage(int currentImageIndex) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png']);
    if (result != null) {
      images[currentImageIndex] = File(result.paths[0]!);
      setState(() => images = images);
    }
  }

  void removeImage(int currentImageIndex) async {
    images.removeAt(currentImageIndex);
    setState(() => images = images);
  }

  void onContinueClick() {
    if (images.length < 2) {
      showSnackBar("Please select at least 2 images");
      return;
    }
    setState(() => isLoading = true);
    productViewModel
        .createMedia(images, widget.product.id, "image")
        .then((media) {
      setState(() => isLoading = false);
      if (media != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) =>
                  VideoSelection(product: widget.product, type: widget.type)));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: const ProductSetupNavBar(step: ProductSteps.Products),
        body: Column(children: [
          Expanded(
              child: ListView(shrinkWrap: true, children: [
            const PageHeader("", "Upload photos of the activity",
                withLogo: false,
                widthFactor: 0.9,
                pageDescriptionPadding: 20,
                headerTopPadding: 0,
                pageTitleBottomPadding: 0,
                pageDescriptionFontSize: 13),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: List.generate(
                    images.isNotEmpty && images.length >= 2 ? images.length : 2,
                    (idx) {
                  if (idx >= images.length) {
                    return GestureDetector(
                      onTap: selectSingleImage,
                      child: SizedBox(
                          height: 160,
                          width: (width - 32) * 0.4,
                          child: const Image(
                              image: AssetImage("assets/defaultImg.png"),
                              fit: BoxFit.cover)),
                    );
                  } else {
                    return SizedBox(
                      height: 180,
                      width: (width - 32) * 0.4,
                      child: Stack(
                        children: [
                          SizedBox(
                              height: 180,
                              width: (width - 32) * 0.4,
                              child:
                                  Image.file(images[idx], fit: BoxFit.cover)),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: (width - 32) * 0.25,
                                      height: 22,
                                      child: Button(() => replaceImage(idx),
                                          actionLabel: "Replace",
                                          labelFontSize: 13,
                                          color: const Color(0xf0FCF2EB),
                                          actionLabelColor: Colors.black,
                                          verticalPadding: 0)),
                                  SizedBox(
                                      width: (width - 32) * 0.15,
                                      height: 22,
                                      child: Button(() => removeImage(idx),
                                          actionLabel: "X",
                                          labelFontSize: 13,
                                          color: const Color(0xf0FCF2EB),
                                          actionLabelColor: Colors.black,
                                          verticalPadding: 0))
                                ],
                              ),
                            ),
                          )
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
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Tap below to select image"),
                    ),
                    SizedBox(
                      width: 160,
                      height: 50,
                      child: Button(
                        selectImage,
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
