import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_column.dart';

import 'custom_details_text_tab.dart';

class DriverServicePanel extends StatelessWidget {
  const DriverServicePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 13),
      child: CustomColumn(
        children: [
          CustomDetailsTextTab(
            mainText:
                "Additional services offered by the driver includes luggage handling, assistance with loading/unloading,",
          ),
        ],
      ),
    );
  }
}
