import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/core/services/i_custom_client.dart';

/// [AppWrapper] Is a top level Class used to wrap your application.
///
/// @params
/// - `child` the widget that will be wrapped by this wrapper
/// - `appName` A required string that identifies your application
/// - `graphQLClient` An instance of [IGraphQlClient] which is the '
/// 'blueprint of a valid GraphQL client.
/// - `appConfig` [context] app running environments.
/// - `eventBus` Used to log events
class AppWrapper extends StatefulWidget {
  const AppWrapper({
    super.key,
    required this.child,
    required this.appName,
    required this.customClient,
    this.eventBus,
  });

  /// [appName] the name of the app
  final String appName;

  /// [child] the widget that will be wrapped by this wrapper
  final Widget child;

  final ICustomClient customClient;

  /// Used to send events to the backend
  final dynamic eventBus;

  @override
  AppWrapperState createState() => AppWrapperState();
}

class AppWrapperState extends State<AppWrapper> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        return AppWrapperBase(
          appName: widget.appName,
          customClient: widget.customClient,
          child: widget.child,
        );
      },
    );
  }
}
