import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';

import '../../../../../../../../common/widgets/custom_grid_selectable_service_types.dart';
import '../../../../../../../../data/local_database.dart';
import '../../../../../../customer_menu/home/views/search_and_filter_views/widgets/custom_apartment_type.dart';
import '../../widgets/custom_edit_view.dart';

class EditShorletApartmentTypeView extends StatefulWidget {
  const EditShorletApartmentTypeView({super.key});

  @override
  State<EditShorletApartmentTypeView> createState() =>
      _EditShorletApartmentTypeViewState();
}

class _EditShorletApartmentTypeViewState
    extends State<EditShorletApartmentTypeView> {
  final apartmentTypes = LocalDatabase.apartmentTypes;
  String selectedApartmentImage = '';
  @override
  Widget build(BuildContext context) {
    return CustomEditView(
      child: CustomColumn(
        children: [
          CustomGridSelectableServiceTypes(
            title: "Kindly select your apartment type",
            style: customTextStyle(fontSize: 16),
            isThereSpaceAfterTitle: true,
            itemCount: apartmentTypes.length,
            itemBuilder: (context, index) {
              final apartmentType = apartmentTypes[index];

              final isApartmentSelected =
                  apartmentType.imageIcon == selectedApartmentImage;
              return CustomApartmentType(
                apartmentType: apartmentType,
                apartmentImageSelected: isApartmentSelected,
                onTap: () {
                  setState(() {
                    selectedApartmentImage = apartmentType.imageIcon;
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
