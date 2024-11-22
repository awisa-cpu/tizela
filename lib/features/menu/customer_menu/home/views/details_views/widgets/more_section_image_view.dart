import 'package:flutter/material.dart';

class MoreSectionImageView extends StatelessWidget {
  const MoreSectionImageView({
    super.key,
    required this.imageItem,
  });

  final String imageItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 130,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          imageItem,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
