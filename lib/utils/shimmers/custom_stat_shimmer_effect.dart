import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import 'app_custom_shimmer.dart';

class CustomStatShimmerEffect extends StatelessWidget {
  const CustomStatShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppCustomShimmerEffect(
              height: 20,
              width: 50,
            ),
            AppCustomShimmerEffect(
              height: 20,
              width: 50,
            ),
          ],
        ),
        const CustomHeight(height: 25),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppCustomShimmerEffect(
              height: 80,
              width: 180,
            ),
            AppCustomShimmerEffect(
              height: 80,
              width: 180,
            ),
          ],
        ),
        const CustomHeight(height: 25),
        AppCustomShimmerEffect(
          height: 80,
          width: context.screenWidth(),
        ),
      ],
    );
  }
}
