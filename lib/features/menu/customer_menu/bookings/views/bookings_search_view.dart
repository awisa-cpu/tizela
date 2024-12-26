import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class BookingsSearchView extends StatelessWidget {
  const BookingsSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        padding: const EdgeInsets.symmetric(
          vertical: kToolbarHeight,
          horizontal: 13.5,
        ),
        child: CustomColumn(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Image.asset(
                          ImagesText.searchIcon,
                          color: AppColors.appMainColor,
                        ),
                        hintText: "Search for booking",
                        hintStyle: customTextStyle(
                          fontSize: 13,
                          color: AppColors.appTextFadedColor,
                          fontWeight: FontWeight.normal,
                        )),
                  ),
                ),
                TextButton(
                  onPressed: () => AppNagivator.goBack(),
                  child: const Text("Cancel"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
