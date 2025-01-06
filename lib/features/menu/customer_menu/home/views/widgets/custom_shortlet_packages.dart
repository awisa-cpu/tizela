import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/widgets/custom_listview.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/shortlet_details_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/single_shorlet.dart';
import 'package:tizela/features/menu/host_menu/listings/model/shorlet_model.dart';
import 'package:tizela/setup/app_navigator.dart';

import '../../../../../../utils/shimmers/custom_data_shimmer_list_view.dart';
import '../../controller/customer_home_controller.dart';

class CustomShortletPackages extends StatelessWidget {
  final List<ShortletModel> shortlets;
  const CustomShortletPackages({
    super.key,
    required this.shortlets,
  });

  @override
  Widget build(BuildContext context) {
    final controller = CustomerHomeController.instance;

    //
    return Obx(
      () {
        return controller.areShortletsLoading.value
            ? const CustomHostDataShimmerListView()
            : CustomListview(
                itemCount: shortlets.length,
                seperatedBuilderHeight: 30.0,
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) {
                  final shorletItem = shortlets[index];

                  return SingleShortlet(
                    onTap: () => AppNagivator.pushRoute(
                      ShortletDetailsView(
                        shortLetItem: shorletItem,
                      ),
                    ),
                    shortlet: shorletItem,
                  );
                },
              );
      },
    );
  }
}
