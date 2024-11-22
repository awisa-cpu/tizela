import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_car_rental_filter_features.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

class EditCarRentalFeatures extends StatelessWidget {
  const EditCarRentalFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEditView(
      child: CustomColumn(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: CustomCarRentalFilterFeatures(),
          ),
          CustomEleButton(onPressed: () {}, text: "Save")
        ],
      ),
    );
  }
}
