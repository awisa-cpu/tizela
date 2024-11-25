import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tizela/features/menu/host_menu/listings/model/app_file_model.dart';

import '../../../../../../../utils/enums/image_type.dart';

class CustomImageDisplayer extends StatelessWidget {
  final double? size;
  final String? imageUrl;
  final AppFileModel? imageFile;
  final BoxFit? fit;
  final VoidCallback? onDoubleTapDelete;
  final ImageType imageType;
  const CustomImageDisplayer({
    super.key,
    this.size,
    this.imageUrl,
    this.imageFile,
    this.fit,
    this.onDoubleTapDelete,
    this.imageType = ImageType.asset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTapDelete,
      child: _switchImage(imageType),
    );
  }

  Widget _switchImage(ImageType type) {
    switch (type) {
      case ImageType.asset:
        return Image.asset(
          imageUrl!,
          width: size,
          height: size,
          fit: fit ?? BoxFit.contain,
        );

      case ImageType.file:
        return Image.file(
          imageFile!.file,
          width: size,
          height: size,
          fit: fit ?? BoxFit.contain,
        );
      case ImageType.network:
        return CachedNetworkImage(
          width: size,
          height: size,
          fit: fit ?? BoxFit.cover,
          imageUrl: imageUrl!,
          errorWidget: (context, url, error) => const Icon(Icons.error_outline),
        );

      default:
        return Image.asset(
          imageUrl!,
          width: size,
          height: size,
          fit: fit ?? BoxFit.contain,
        );
    }
  }
}
