import 'package:flutter/material.dart';

class CustomScrollableLayoutWidget extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget child;
  const CustomScrollableLayoutWidget({
    super.key,
    this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(13.5),
        child: child,
      ),
    );
  }
}
