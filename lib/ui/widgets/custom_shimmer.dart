import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    required this.enabled,
    required this.child,
    super.key,
  });

  final bool enabled;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).highlightColor.withOpacity(0.25),
      highlightColor: Theme.of(context).highlightColor.withOpacity(0.5),
      enabled: enabled,
      child: child,
    );
  }
}
