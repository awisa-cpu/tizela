import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_type_model.dart';

import '../../../../../../../../data/local_database.dart';
import '../../../new_listing/boat_cruise/widgets/custom_boat_type.dart';
import '../../widgets/custom_edit_view.dart';

class EditBoatCruiseType extends StatefulWidget {
  const EditBoatCruiseType({super.key});

  @override
  State<EditBoatCruiseType> createState() => _EditBoatCruiseTypeState();
}

class _EditBoatCruiseTypeState extends State<EditBoatCruiseType> {
  final boats = LocalDatabase.boatTypes;
  BoatTypeModel selectedBoatType = BoatTypeModel.empty();
  @override
  Widget build(BuildContext context) {
    return CustomEditView(
      child: CustomColumn(
        children: [
          CustomGridSelectableServiceTypes(
            title: "Kindly select your boat type",
            style: customTextStyle(fontSize: 16),
            isThereSpaceAfterTitle: true,
            itemCount: boats.length,
            itemBuilder: (context, index) {
              final boat = boats[index];

              final isBoatTypeSelected = boat == selectedBoatType;
              return CustomBoatType(
                boatType: boat,
                isBoatSelected: isBoatTypeSelected,
                onTap: () {
                  selectedBoatType = boat;
                  setState(() {});
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
