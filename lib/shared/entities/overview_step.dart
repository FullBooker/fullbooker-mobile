import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';

class OverviewStep {
  OverviewStep({
    required this.imagePath,
    required this.title,
    required this.copy,
  });

  final String imagePath;
  final String copy;
  final String title;
}

List<OverviewStep> overviewSteps = <OverviewStep>[
  OverviewStep(
    imagePath: appOverView1ImagePath,
    title: overview1Title,
    copy: overview1Copy,
  ),
  OverviewStep(
    imagePath: appOverView2ImagePath,
    title: overview2Title,
    copy: overview2Copy,
  ),
  OverviewStep(
    imagePath: appOverView3ImagePath,
    title: overview3Title,
    copy: overview3Copy,
  ),
];
