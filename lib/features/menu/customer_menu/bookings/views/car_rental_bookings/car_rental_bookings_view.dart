import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/car_rental_bookings/widgets/custom_car_rental_bookings_first_section.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/car_rental_bookings/widgets/custom_car_rental_bookings_form.dart';
import '../../../../../../utils/device/app_device_services/app_device_services.dart';
import '../../../../host_menu/listings/model/car_rental_model.dart';

class CarRentalBookingsView extends StatefulWidget {
  final CarRentalModel carRental;
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
      body: CustomScrollableLayoutWidget(
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
