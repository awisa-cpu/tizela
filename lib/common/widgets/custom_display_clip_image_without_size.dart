import 'package:flutter/material.dart';

class CustomDisplayClipImageWithoutSize extends StatelessWidget {
  const CustomDisplayClipImageWithoutSize({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        imageUrl,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.contain,
      ),
    );
  }
}
