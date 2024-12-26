import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/bookings/views/widget/custom_host_shorlet_bookings_tab.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/custom_host_header_text_with_action_button.dart';

class CustomShortletHomeDataView extends StatelessWidget {
  const CustomShortletHomeDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        CustomHostHeaderTextWithActionButton(
          title: "Recent bookings",
          count: "3",
          onTap: () {},
        ),
        CustomListview(
          itemCount: 2,
          itemBuilder: (_, index) {
            return const CustomHostShorletBookingsTab(
              isOngoing: true,
              stateColor: Colors.transparent,
            );
          },
        ),
      ],
    );
  }
}