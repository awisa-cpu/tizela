import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/custom_details_text_tab.dart';

class SailorServicePanel extends StatelessWidget {
  const SailorServicePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 13),
      child: CustomColumn(
        children: [
          CustomDetailsTextTab(
            mainText:
                "Additional services offered by the sailor includes luggage handling, assistance with loading/unloading.",
          ),
        ],
      ),
    );
  }
}
