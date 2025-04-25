import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';

import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';

@RoutePage()
class SharedLandingPage extends StatefulWidget {
  const SharedLandingPage({super.key});

  @override
  State<SharedLandingPage> createState() => _SharedLandingPageState();
}

class _SharedLandingPageState extends State<SharedLandingPage> {
  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_navigated) return;
      _navigated = true;

      final AppState state = StoreProvider.state<AppState>(context);
      final bool isSignedIn = state.authState?.isSignedIn ?? false;

      if (!mounted) return;

      await context.router.replace(
        isSignedIn ? const HostingHomeRoute() : const LoginRoute(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Image(image: AssetImage(logoSplashImagePath)),
        ),
      ),
    );
  }
}
