import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';

import '../../../../../../../../common/widgets/custom_grid_selectable_service_types.dart';
import '../../../../../../../../data/local_database.dart';
import '../../../new_listing/car_rental/widgets/custom_car_type.dart';
import '../../widgets/custom_edit_view.dart';

class EditCarRentalType extends StatefulWidget {
  const EditCarRentalType({super.key});

  @override
  State<EditCarRentalType> createState() => _EditCarRentalTypeState();
}


class _EditCarRentalTypeState extends State<EditCarRentalType> {
  final cars = LocalDatabase.carTypeName;
  String selectedCarType = "";
  @override
  Widget build(BuildContext context) {
    return CustomEditView(
      child: CustomColumn(
        children: [
          CustomGridSelectableServiceTypes(
            title: "Kindly select your apartment type",
            style: customTextStyle(fontSize: 16),
            isThereSpaceAfterTitle: true,
            itemCount: cars.length,
            itemBuilder: (context, index) {
              final car = cars[index];

              final isCarTypeSelected = car == selectedCarType;
              return CustomCarType(
                carType: car,
                isCarTypeSelected: isCarTypeSelected,
                onTap: () {
                  setState(() {
                    selectedCarType = car;
                  });
                },
              );
            },
          ),
          CustomEleButton(
            onPressed: () {},
            text: "Save",
          )
        ],
      ),
    );
  }
}
