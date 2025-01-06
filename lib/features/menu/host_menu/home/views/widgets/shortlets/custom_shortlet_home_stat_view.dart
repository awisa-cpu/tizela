import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/custom_analytics_tab.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/custom_host_home_stat_filter_view.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/host_home_total_earnings_view.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import 'package:tizela/utils/shimmers/custom_stat_shimmer_effect.dart';

import '../../../../../../../utils/loaders/app_stream_loaders.dart';
import '../../../controllers/host_shortlet_home_controller.dart';

class CustomShortletHomeStatView extends StatelessWidget {
  const CustomShortletHomeStatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final shortletHomeCon = HostShortletHomeController.instance;

    //
    return StreamBuilder(
      stream: shortletHomeCon.getShortletTotalListings(),
      builder: (context, snapshot) {
        const statShimmer = CustomStatShimmerEffect();

        final widget = AppStreamLoaders.checkMultiStreamState(
          snapshot: snapshot,
          loaderWidget: statShimmer,
          nothingFoundWidget: const SizedBox.shrink(),
        );

        if (widget != null) {
          return widget;
        }

        final shortletData = snapshot.data!;

        return CustomColumn(
          children: [
            //first part:
            CustomHostHomeStatFilterView(
              title: "Stats",
              dropdownvalue: "This Month",
              menuItems: const ["This Month", "Last Month", "2 month ago"],
              onItemChanged: (newValue) {},
            ),
            const CustomHeight(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomAnalyticsTab(
                  headerText: "Total listing",
                  itemCount: shortletData.length.toString(),
                  onTap: () {},
                ),
                CustomAnalyticsTab(
                  headerText: "Total booking",
                  itemCount: "0",
                  onTap: () {},
                ),
              ],
            ),
            const CustomHeight(height: 25),
            CustomAnalyticsTab(
              headerText: "Total Earning",
              itemCount: "#0.00",
              width: context.screenWidth(),
              onTap: () {
                AppNagivator.pushRoute(
                 const HostHomeTotalEarningsView(),
                );
              },
            ),
            const CustomHeight(height: 25),
          ],
        );
      },
    );
  }
}
