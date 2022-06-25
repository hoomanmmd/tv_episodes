import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_episode_tracker/ui/screens/home/blocs/home_bloc.dart';
import 'package:tv_episode_tracker/ui/screens/home/home_screen.dart';

import '../../../data/fake_api_client.dart';
import '../../helper/test_app.dart';
import 'home_bloc_test.dart';

void main() {
  testWidgets('Home Screen rendering', (tester) async {
    await tester.pumpWidget(
      BlocProvider<HomeBloc>(
        create: (context) => homeBloc(),
        child: const TestApp(child: HomeScreen()),
      ),
    );

    expect(find.byKey(const Key('home_screen_list')), findsOneWidget);
    expect(find.byKey(const Key('retry_wrapper_button')), findsNothing);
  });

  testWidgets('Home Screen must show reload button on error', (tester) async {
    await tester.pumpWidget(
      BlocProvider<HomeBloc>(
        create: (context) => homeBloc(
          apiClient: FakeApiClient(movieListError: 'drr'),
        ),
        child: const TestApp(child: HomeScreen()),
      ),
    );

    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byKey(const Key('retry_wrapper_button')), findsOneWidget);
  });
}
