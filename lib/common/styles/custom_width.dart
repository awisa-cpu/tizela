import 'package:flutter/material.dart';

class CustomWidth extends StatelessWidget {
  final double? width;
  const CustomWidth({
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 10.0,
    );
  }
}
