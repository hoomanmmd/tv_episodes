import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../commons/theme/custom_color_scheme.dart';
import 'filled_button.dart';

class RetryWrapper extends StatelessWidget {
  const RetryWrapper({
    required this.child,
    this.onRetry,
    super.key,
  });

  final Widget child;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(child: _overlay(context)),
      ],
    );
  }

  Widget _overlay(BuildContext context) {
    return AnimatedOpacity(
      opacity: onRetry == null ? 0 : 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      child: onRetry == null
          ? const SizedBox.shrink()
          : Container(
              color: Theme.of(context).canvasColor.withOpacity(0.7),
              child: Center(
                child: FilledButton(
                  key: const Key('retry_wrapper_button'),
                  onPressed: onRetry,
                  backgroundColor: Theme.of(context)
                      .extension<CustomColorScheme>()!
                      .successColor,
                  label: AppLocalizations.of(context)!.retry,
                ),
              ),
            ),
    );
  }
}
