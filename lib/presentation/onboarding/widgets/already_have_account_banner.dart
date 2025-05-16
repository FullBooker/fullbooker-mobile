import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: alreadyHaveAnAccountString,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          TextSpan(
            text: loginString,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.router.replace(LoginRoute()),
          ),
        ],
      ),
    );
  }
}
