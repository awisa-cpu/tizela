import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';

class CustomBookingSummaryTab extends StatelessWidget {
  final Widget child;
  final double? height;
  const CustomBookingSummaryTab({super.key, required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      height: height,
      boxShadow: [
        BoxShadow(
          offset: const Offset(1, 2),
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 7,
          blurRadius: 5,
        )
      ],
      paddingNumber: 15,
      borderRadius: 12,
      child: child,
    );
  }
}
