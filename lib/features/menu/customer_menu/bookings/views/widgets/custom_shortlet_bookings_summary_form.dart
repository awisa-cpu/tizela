import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/success_view.dart';
import 'package:tizela/setup/app_navigator.dart';

class CustomShortletBookingsSummaryForm extends StatelessWidget {
  const CustomShortletBookingsSummaryForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: CustomColumn(
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "First name"),
          ),
          const CustomHeight(height: 15),
          TextFormField(
            decoration: const InputDecoration(hintText: "Last name"),
          ),
          const CustomHeight(height: 15),
          TextFormField(
            decoration: const InputDecoration(hintText: "Email Address"),
          ),
          const CustomHeight(height: 15),
          Row(
            children: [
              Expanded(child: TextFormField()),
              const CustomWidth(width: 15),
              Expanded(
                flex: 3,
                child: TextFormField(
                  decoration: const InputDecoration(hintText: "Phone number"),
                ),
              ),
            ],
          ),
          const CustomHeight(height: 20),
          CustomEleButton(
            onPressed: () => AppNagivator.pushRoute(
            const SuccessView(
                  mainText: "Booking successful",
                  subText:
                      "Thank you for your bookings, we will get back to you as soon as possible"),
            ),
            text: "Pay",
          )
        ],
      ),
    );
  }
}
