// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomColumn extends StatelessWidget {
  final bool isMainAxisSize;
  final List<Widget> children;
  final double? spacing;
  final CrossAxisAlignment? crossAxisAlignment;
  const CustomColumn(
      {super.key,
      this.isMainAxisSize = true,
      required this.children,
      this.crossAxisAlignment,
      this.spacing});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: spacing ?? 0.0,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisSize: isMainAxisSize ? MainAxisSize.min : MainAxisSize.max,
      children: children,
    );
  }
}
