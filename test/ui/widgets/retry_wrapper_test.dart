import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_episode_tracker/ui/widgets/retry_wrapper.dart';

import '../helper/test_app.dart';

void main() {
  testWidgets('Retry wrapper when there is no error', (tester) async {
    await tester.pumpWidget(
      const TestApp(child: RetryWrapper(child: SizedBox.shrink())),
    );

    expect(find.byKey(const Key('retry_wrapper_button')), findsNothing);
  });

  testWidgets('Retry wrapper when there is an error', (tester) async {
    await tester.pumpWidget(
      TestApp(
        child: RetryWrapper(
          child: const SizedBox.shrink(),
          onRetry: () {},
        ),
      ),
    );

    expect(find.byKey(const Key('retry_wrapper_button')), findsOneWidget);
  });
}
