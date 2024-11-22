import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomAddImageButton extends StatelessWidget {
  final VoidCallback onImageSelect;
  const CustomAddImageButton({
    super.key,
    required this.onImageSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onImageSelect.call();
      },
      child: CustomRoundedEdgedContainer(
        borderWidth: 1.5,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagesText.galleryAddIcon),
            const CustomWidth(width: 15),
            const Text("Add photo")
          ],
        ),
      ),
    );
  }
}
