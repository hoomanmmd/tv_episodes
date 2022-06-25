import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  const FilledButton({
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    super.key,
  });

  final Color? backgroundColor;

  final VoidCallback? onPressed;

  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(primary: backgroundColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(label),
      ),
    );
  }
}
