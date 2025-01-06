import 'package:flutter/widgets.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_listview.dart';
import 'package:tizela/utils/shimmers/custom_host_data_shimmer.dart';

import 'app_custom_shimmer.dart';

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
