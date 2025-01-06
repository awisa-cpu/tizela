import 'package:flutter/widgets.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/utils/shimmers/app_custom_shimmer.dart';

class CustomHostDataShimmer extends StatelessWidget {
  const CustomHostDataShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomColumn(
      children: [
        CustomHeight(),
        AppCustomShimmerEffect(
          height: 270,
          width: double.infinity,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        CustomHeight(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppCustomShimmerEffect(height: 20, width: 70),
            AppCustomShimmerEffect(height: 20, width: 20),
          ],
        ),
        CustomHeight(),
        AppCustomShimmerEffect(height: 20, width: 70),
        CustomHeight(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppCustomShimmerEffect(height: 20, width: 50),
            AppCustomShimmerEffect(height: 20, width: 40),
          ],
        ),
        CustomHeight(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppCustomShimmerEffect(height: 20, width: 30),
            AppCustomShimmerEffect(height: 20, width: 30),
            AppCustomShimmerEffect(height: 20, width: 30),
          ],
        ),
      ],
    );
  }
}
