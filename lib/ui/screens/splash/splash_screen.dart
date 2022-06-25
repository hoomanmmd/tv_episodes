import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../home/home_screen.dart';

class SplashScreen extends HookWidget {
  static const routeName = '/splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController();
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/cinema_splash.json',
          width: 320,
          height: 200,
          controller: controller,
          onLoaded: (composition) =>
              _onLoaded(context, composition, controller),
        ),
      ),
    );
  }

  void _onLoaded(
    BuildContext context,
    LottieComposition composition,
    AnimationController controller,
  ) {
    controller
      ..duration = composition.duration
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          context.go(HomeScreen.routeName);
        }
      })
      ..forward();
  }
}
