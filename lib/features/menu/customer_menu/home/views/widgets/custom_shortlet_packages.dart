import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_listview.dart';
import 'package:tizela/features/menu/customer_menu/home/model/shorlet_model_xxxxx.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/shortlet_details_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/single_shorlet_package.dart';
import 'package:tizela/setup/app_navigator.dart';

class CustomShorletPackages extends StatelessWidget {
  final List<ShortletModelxxxxxxxxxxxxxxxx> shortletPackages;
  const CustomShorletPackages({
    super.key,
    required this.shortletPackages,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListview(
      itemCount: shortletPackages.length,
      seperatedBuilderHeight: 25.0,
      itemBuilder: (_, index) {
        final shorletItem = shortletPackages[index];

        return SingleShortletPackage(
          onTap: () => AppNagivator.pushRoute(
            context,
            (context) => ShortletDetailsView(
              shortLetItem: shorletItem,
            ),
          ),
          shortlet: shorletItem,
        );
      },
    );
  }
}
