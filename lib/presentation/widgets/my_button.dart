import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyButton extends ConsumerWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  const MyButton({super.key, required this.text, this.onPressed, this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    return TextButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 55),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(text, style: textStyle.bodyLarge),
    );
  }
}
