import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_listview.dart';
import 'package:tizela/features/menu/host_menu/listings/views/widgets/custom_slider_indicator.dart';

class CustomSliderIndicatorsPageView extends StatelessWidget {
  final int currentSelectedPage;
  final int? itemCount;
  const CustomSliderIndicatorsPageView({
    super.key,
    required this.currentSelectedPage,
    this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kToolbarHeight,
        bottom: 20,
      ),
      child: SizedBox(
        height: 5,
        child: CustomListview(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount ?? 7,
          itemBuilder: (_, index) => CustomSliderIndicator(
            initialValue: index,
            currentPageIndex: currentSelectedPage,
          ),
        ),
      ),
    );
  }
}
