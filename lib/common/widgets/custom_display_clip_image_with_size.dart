import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_network_image.dart';

class CustomDisplayClipImageWithSize extends StatelessWidget {
  const CustomDisplayClipImageWithSize({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadius,
    this.fit,
    this.borderRadi,
    this.isNetworkImage = false,
  });

  final String imageUrl;
  final double? height, width, borderRadius;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadi;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadi ?? BorderRadius.circular(borderRadius ?? 10),
      child: SizedBox(
        height: height ?? 100,
        width: width ?? 110,
        child: isNetworkImage
            ? CustomCachedNetworkImage(
                fit: fit ?? BoxFit.cover,
                networkImageUrl: imageUrl,
                errorWidget: const Icon(Icons.error_outline)
                    ,
              )
            : Image.asset(
                imageUrl,
                fit: fit ?? BoxFit.cover,
              ),
      ),
    );
  }
}
