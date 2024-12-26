import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl, this.imageWidth, this.imageHeigth, this.fit, this.errorWidget,
  });

  final String imageUrl;
  final double? imageWidth, imageHeigth;
  final BoxFit? fit;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: imageWidth,
      height: imageHeigth,


      errorWidget: (context, url, error) =>  errorWidget?? const  Icon(Icons.error),
    );
  }
}
