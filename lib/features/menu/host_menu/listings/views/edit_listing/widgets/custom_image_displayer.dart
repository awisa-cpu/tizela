import 'package:flutter/material.dart';
import 'package:tizela/features/menu/host_menu/listings/model/app_file_model.dart';

class CustomImageDisplayer extends StatelessWidget {
  final double? size;
  final String? imageUrl;
  final bool isImageFromFile;
  final AppFileModel? imageFile;
  final BoxFit? fit;
  final VoidCallback? onDoubleTapDelete;
  const CustomImageDisplayer({
    super.key,
    this.size,
    this.imageUrl,
    this.isImageFromFile = false,
    this.imageFile,
    this.fit,
    this.onDoubleTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTapDelete,
      child: isImageFromFile
          ? Image.file(
              imageFile!.file,
              width: size,
              height: size,
              fit: fit,
            )
          : Image.asset(
              imageUrl!,
              width: size,
              height: size,
              fit: BoxFit.contain,
            ),
    );
  }
}
