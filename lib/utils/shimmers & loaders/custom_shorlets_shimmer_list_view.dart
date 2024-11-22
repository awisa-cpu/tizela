import 'package:flutter/widgets.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_listview.dart';
import 'package:tizela/utils/shimmers%20&%20loaders/app_custom_shimmer.dart';

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

class CustomHostDataShimmerListView extends StatelessWidget {
  const CustomHostDataShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        const AppCustomShimmerEffect(
            height: 30, width: double.infinity, radius: 5),
        const CustomHeight(),
        CustomListview(
          itemCount: 3,
          itemBuilder: (_, __) => const CustomHostDataShimmer(),
        )
      ],
    );
  }
}
