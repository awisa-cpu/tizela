import 'package:flutter/material.dart';

class CustomHeight extends StatelessWidget {
  final double? height;
  const CustomHeight({
    super.key,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 10.0,
    );
  }
}
