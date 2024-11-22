import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppCustomShimmerEffect extends StatelessWidget {
  final double height, width, radius;
  final Color? color;
  final BorderRadius? borderRadius;

  const AppCustomShimmerEffect({
    super.key,
    required this.height,
    required this.width,
    this.radius = 10,
    this.color,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: borderRadius ??BorderRadius.circular(radius),
            
            ),
      ),
    );
  }
}
