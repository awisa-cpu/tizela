import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_network_image.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

class CustomDisplayClipImageWithoutSize extends StatelessWidget {
  const CustomDisplayClipImageWithoutSize({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CustomCachedNetworkImage(
        networkImageUrl: imageUrl,
        imageHeigth: 260,
        imageWidth: context.screenWidth(),
        fit: BoxFit.cover,
      ),
    );
  }
}
