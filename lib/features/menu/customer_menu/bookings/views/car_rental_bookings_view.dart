import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/car_rental_bookings_summary_view.dart';
import 'package:tizela/features/menu/customer_menu/home/model/car_rental_model_xxxxx.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../../../../../utils/device/app_device_services/app_device_services.dart';

class CarRentalBookingsView extends StatefulWidget {
  final CarRentalModelxxxxxxxxxxx carRental;
  const CarRentalBookingsView({
    super.key,
    required this.carRental,
  });

  @override
  State<CarRentalBookingsView> createState() => _CarRentalBookingsViewState();
}

class _CarRentalBookingsViewState extends State<CarRentalBookingsView> {
  @override
  void initState() {
    super.initState();
    AppDeviceServices.restoreStatusBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Booking",
          style: customTextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: CustomScrollLayoutWidget(
        child: CustomColumn(
          isMainAxisSize: false,
          children: [
            CustomCarRentalBookingsFirstSection(carRental: widget.carRental),
            const CustomHeight(height: 10),
            CustomCarRentalBookingsForm(
              carRental: widget.carRental,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCarRentalBookingsForm extends StatelessWidget {
  final CarRentalModelxxxxxxxxxxx carRental;
  const CustomCarRentalBookingsForm({
    super.key,
    required this.carRental,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: CustomColumn(
        children: [
          Text(
            "Pick-up time",
            style: customTextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          const CustomHeight(height: 10),
          TextFormField(
            decoration: const InputDecoration(hintText: "08:00am"),
          ),
          const CustomHeight(height: 40),
          Text(
            "Booking duration",
            style: customTextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          const CustomHeight(height: 10),
          DropdownButtonFormField(
            enableFeedback: false,
            value: LocalDatabase.durations[0],
            items: LocalDatabase.durations.map<DropdownMenuItem>((duration) {
              return DropdownMenuItem(
                value: duration,
                child: Text(duration),
              );
            }).toList(),
            onChanged: (newValue) {},
          ),
          const CustomHeight(height: 10),
          Row(
            children: [
              const Icon(
                Icons.info_outline_rounded,
                color: AppColors.appMainColor,
                size: 18.33,
              ),
              const CustomWidth(width: 10),
              Text(
                "Cars must be booked for at least 12 hours.",
                style: customTextStyle(
                    fontSize: 12,
                    color: AppColors.appTextFadedColor,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          const CustomHeight(height: 50),
          Text(
            "Enter Itinerary",
            style: customTextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          const CustomHeight(height: 10),
          TextFormField(
            decoration: const InputDecoration(hintText: "Type here..."),
            maxLines: 7,
          ),
          const CustomHeight(height: 30),
          CustomEleButton(
              onPressed: () {
                AppNagivator.pushRoute(
                  context,
                  (_) => CarRentalBookingSummary(
                    carRental: carRental,
                  ),
                );
              },
              text: "Proceed"),
        ],
      ),
    );
  }
}

class CustomCarRentalBookingsFirstSection extends StatelessWidget {
  const CustomCarRentalBookingsFirstSection({
    super.key,
    required this.carRental,
  });

  final CarRentalModelxxxxxxxxxxx carRental;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      boxShadow: [
        BoxShadow(
          offset: const Offset(1, 2),
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 7,
          blurRadius: 5,
        )
      ],
      paddingNumber: 15,
      borderRadius: 12,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 100,
              width: 110,
              child: Image.asset(
                carRental.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const CustomWidth(width: 10),
          CustomColumn(
            children: [
              //name
              Text(
                carRental.name,
                style: customTextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const CustomHeight(height: 5),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomIconAndText(
                    imageIcon: ImagesText.userIcon,
                    text: "4",
                    color: AppColors.appIconColorBox,
                    textStyle: customTextStyle(
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const CustomWidth(width: 5),
                  CustomIconAndText(
                    imageIcon: ImagesText.holidayBagIcon,
                    text: "2",
                    color: AppColors.appIconColorBox,
                    textStyle: customTextStyle(
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const CustomWidth(width: 5),
                  CustomIconAndText(
                    imageIcon: ImagesText.acIcon,
                    text: "AC",
                    color: AppColors.appIconColorBox,
                    textStyle: customTextStyle(
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const CustomHeight(height: 5),
              //cost
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "#${carRental.cost}",
                      style: customTextStyle(
                        color: AppColors.appMainColor,
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: " / hr",
                      style: customTextStyle(
                          color: AppColors.appMainColor,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
