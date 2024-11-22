import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/common/widgets/custom_grid_selectable_service_types.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_apartment_type.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_filter_header.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_shorlet_filter_house_rules.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_shorlet_filter_price_range.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_shorlet_filter_safetycheckboxes.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_shorlet_filter_standout_amenities.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_shortlet_bathrooms.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_shortlet_filter_amenities.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_shortlet_filter_bedrooms.dart';

class CustomShortletFilter extends StatefulWidget {
  const CustomShortletFilter({
    super.key,
  });

  @override
  State<CustomShortletFilter> createState() => _CustomShortletFilterState();
}

class _CustomShortletFilterState extends State<CustomShortletFilter> {
  final apartmentTypes = LocalDatabase.apartmentTypes;
  String selectedApartmentImage = '';
  @override
  Widget build(BuildContext context) {
    return CustomScrollLayoutWidget(
      child: CustomColumn(
        isMainAxisSize: false,
        children: [
          const CustomFilterHeader(),
          const CustomHeight(height: 15),
          const CustomDivider(),
          const CustomFilterPriceRange(
            minPrice: "150,000",
            maxPrice: "700,000",
            progressIndicatorValue: 0.55,
          ),
          const CustomDivider(),
          const CustomHeight(height: 40),
          Text(
            "Rooms and Bathroomsss",
            style: customTextStyle(
              fontSize: 14,
            ),
          ),
          const CustomHeight(height: 15),
          const CustomShortletFilterBedrooms(),
          const CustomHeight(height: 15),
          const CustomShortletBathrooms(),
          const CustomDivider(),
          CustomGridSelectableServiceTypes(
            title: "Select apartment type",
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
          const CustomDivider(),
          const CustomHeight(height: 40),
          const CustomShortletFilterAmenities(),
          const CustomDivider(),
          const CustomHeight(height: 40),
          const CustomShorletFilterSafetycheckboxes(),
          const CustomDivider(),
          const CustomHeight(height: 40),
          const CustomShorletFilterStandoutAmenities(),
          const CustomDivider(),
          const CustomHeight(height: 40),
          const CustomShorletFilterHouseRules(),
        ],
      ),
    );
  }
}
