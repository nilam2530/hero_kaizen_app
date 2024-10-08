import 'package:flutter/material.dart';
import 'package:hero_kaizen_app/src/common_widgets/buttons/primary_button.dart';
import 'package:hero_kaizen_app/src/constants/app_sizes.dart';
import 'package:hero_kaizen_app/src/utils/string_hardcoded_ext.dart';

/// Placeholder widget showing a message and CTA to go back to the home screen.
class EmptyPlaceholderWidget extends StatelessWidget {
  const EmptyPlaceholderWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            gapH32,
            PrimaryButton(
              //onPressed: () => context.goNamed(AppRoute.login.name),
              onPressed: () {},
              text: 'Go Home'.hardcoded,
            )
          ],
        ),
      ),
    );
  }
}
