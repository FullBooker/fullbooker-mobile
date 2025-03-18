import 'package:flutter/widgets.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';

/// [AppWrapperBase] is a top level base class used to efficiently propagate information down the tree.
///
/// It extends [InheritedWidget] and provides consumers with additional data about the device the apps are running on.
///
/// Consumers will rebuild when the state of this widget changes.
///
/// It provides out of the box implementation of client methods that can be overridden.
/// - `appName` A required string that identifies your application.
/// - `appConfig` [appConfig] app running environments.
/// and Device BiometricType (face or fingerprint).
/// - `eventBus` Used to log events
/// - `shouldNotify` bool used to determine whether the framework should notify widgets that inherit from this widget.
/// This parameter is set to true by default.
class AppWrapperBase extends InheritedWidget {
  const AppWrapperBase({
    super.key,
    required super.child,
    required this.appName,
    required this.customClient,
    this.shouldNotify = true,
  });

  final String appName;

  final ICustomClient customClient;
  final bool shouldNotify;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => shouldNotify;

  static AppWrapperBase? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppWrapperBase>();
}
