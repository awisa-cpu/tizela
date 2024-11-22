import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String actionText;
  final VoidCallback onTap;
  final ButtonStyle? style;
  final double? width;
  final Widget? child;
  const CustomOutlinedButton({
    super.key,
    required this.actionText,
    required this.onTap,
    this.style,
    this.width, this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: OutlinedButton(
        style: style,
        onPressed: onTap,
        child:  child??Text(actionText),
      ),
    );
  }
}
