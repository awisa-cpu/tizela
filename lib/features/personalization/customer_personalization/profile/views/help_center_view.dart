import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_header_sub_and_back_button.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/widgets/custom_contact_us_services.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/widgets/custom_tab_button_with_icon_and_text.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/widgets/help_center_boat_cruise_faq_item.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/widgets/help_center_faq_car_rental_item.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/widgets/help_center_shorlet_faq_item.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class HelpCenterView extends StatefulWidget {
  const HelpCenterView({super.key});

  @override
  State<HelpCenterView> createState() => _HelpCenterViewState();
}

class _HelpCenterViewState extends State<HelpCenterView> {
  late bool isFaqSelected;
  bool isContactUsSelected = false;
  Color faqTextAndBorderColor = AppColors.appMainColor;
  Color cUsTextAndBorderColor = const Color(0xFF878787);
  late double faqTextSize;
  double conTactUsTextSize = 14.0;
  late double faqWidth;
  double contactUsWidth = 1.0;

  @override
  void initState() {
    super.initState();
    isFaqSelected = true;
    faqTextAndBorderColor = AppColors.appMainColor;
    faqTextSize = 16.0;
    faqWidth = 2.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollLayoutWidget(
        padding: const EdgeInsets.symmetric(
          vertical: kToolbarHeight,
          horizontal: 13.5,
        ),
        child: CustomColumn(
          children: [
            const CustomHeaderSubAndBackButton(
              headerText: "Help center",
              isthereSubText: false,
            ),

            //tabs
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _updateFaqTabButton(),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.appWhiteColor,
                        border: Border(
                          bottom: BorderSide(
                            color: faqTextAndBorderColor,
                            width: faqWidth,
                          ),
                        ),
                      ),
                      child: Text(
                        "FAQ",
                        style: customTextStyle(
                            color: faqTextAndBorderColor,
                            fontSize: faqTextSize),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _updateContactUsTabButton(),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.appWhiteColor,
                        border: Border(
                          bottom: BorderSide(
                            color: cUsTextAndBorderColor,
                            width: contactUsWidth,
                          ),
                        ),
                      ),
                      child: Text(
                        "Contact us",
                        style: customTextStyle(
                            color: cUsTextAndBorderColor,
                            fontSize: conTactUsTextSize),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //tab views
            if (isFaqSelected) const CustomFaqServices(),
            if (isContactUsSelected) const CustomContactUsServices(),
            //
          ],
        ),
      ),
    );
  }

  void _updateFaqTabButton() {
    setState(
      () {
        isFaqSelected = true;
        isContactUsSelected = false;

        //

        if (isFaqSelected) {
          faqTextAndBorderColor = AppColors.appMainColor;
          cUsTextAndBorderColor = const Color(0xFF878787);
          faqTextSize = 16.0;
          conTactUsTextSize = 14.0;
          faqWidth = 2.0;
          contactUsWidth = 1.0;
        }
      },
    );
  }

  void _updateContactUsTabButton() {
    setState(
      () {
        isFaqSelected = false;
        isContactUsSelected = true;

        //
        if (isContactUsSelected) {
          cUsTextAndBorderColor = AppColors.appMainColor;
          faqTextAndBorderColor = const Color(0xFF878787);
          conTactUsTextSize = 16.0;
          faqTextSize = 14.0;
          contactUsWidth = 2.0;
          faqWidth = 1.0;
        }
      },
    );
  }
}

class CustomFaqServices extends StatefulWidget {
  const CustomFaqServices({super.key});

  @override
  State<CustomFaqServices> createState() => _CustomFaqServicesState();
}

class _CustomFaqServicesState extends State<CustomFaqServices> {
  late bool isShorletSelected;
  bool isCarRentalSelected = false;
  bool isBoatCruiseSelected = false;

  //color
  late Color shorletTextAndIconColor;
  Color carRentalTextAndIconColor =
      AppColors.appTextFadedColor.withOpacity(0.8);
  Color boatCruiseTextAndIconColor =
      AppColors.appTextFadedColor.withOpacity(0.8);

  late Color shorletmainAndBorderColor;
  Color carRentalmainAndBorderColor = AppColors.appWhiteColor;
  Color boatCruisemainAndBorderColor = AppColors.appWhiteColor;

  //
  @override
  void initState() {
    super.initState();
    isShorletSelected = true;
    shorletTextAndIconColor = AppColors.appWhiteColor;
    shorletmainAndBorderColor = AppColors.appMainColor;
  }

  @override
  Widget build(BuildContext context) {
    final shortletFaqs = LocalDatabase.helpCenterShorletFaqs;
    final carRentaFaqs = LocalDatabase.helpCenterCarRentaFaqs;
    final boatCruiseFaqs = LocalDatabase.helpCenterBoatCruiseFaqs;

    //
    return CustomColumn(
      isMainAxisSize: false,
      children: [
        //tabsEd

        const CustomHeight(height: 20),
        SizedBox(
          height: 55,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CustomTabButtonWithIconAndText(
                text: "Shorlet",
                imageUrl: ImagesText.buildingIcon,
                textIconAndBorderColor: shorletTextAndIconColor,
                mainColor: shorletmainAndBorderColor,
                onTap: _onShorletChange,
              ),
              CustomTabButtonWithIconAndText(
                text: "Car rental",
                imageUrl: ImagesText.carIcon,
                textIconAndBorderColor: carRentalTextAndIconColor,
                mainColor: carRentalmainAndBorderColor,
                onTap: _onCarRentalChange,
              ),
              CustomTabButtonWithIconAndText(
                text: "Boat cruise",
                imageUrl: ImagesText.shipIcon,
                textIconAndBorderColor: boatCruiseTextAndIconColor,
                mainColor: boatCruisemainAndBorderColor,
                onTap: _onBoatCruiseChange,
              ),
            ],
          ),
        ),

        //various packages based on what is selected
        if (isShorletSelected)
          ListView.separated(
            itemCount: shortletFaqs.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              final shorletFaq = shortletFaqs[index];

              return HelpCenterShorletFaqItem(
                shorletFaq: shorletFaq,
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
              height: 40,
            ),
          ),
        if (isCarRentalSelected)
          ListView.separated(
            itemCount: carRentaFaqs.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              final carRentalFaq = carRentaFaqs[index];

              return HelpCenterFaqCarRentalItem(
                shorletFaq: carRentalFaq,
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
              height: 40,
            ),
          ),
        if (isBoatCruiseSelected)
          ListView.separated(
            itemCount: boatCruiseFaqs.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              final boatCruiseFaq = boatCruiseFaqs[index];

              return HelpCenterBoatCruiseFaqItem(
                shorletFaq: boatCruiseFaq,
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
              height: 40,
            ),
          )
      ],
    );
  }

  void _onShorletChange() {
    setState(() {
      isShorletSelected = true;
      isCarRentalSelected = false;
      isBoatCruiseSelected = false;

      if (isShorletSelected) {
        shorletTextAndIconColor = AppColors.appWhiteColor;
        shorletmainAndBorderColor = AppColors.appMainColor;

        //
        carRentalTextAndIconColor =
            AppColors.appTextFadedColor.withOpacity(0.8);
        boatCruiseTextAndIconColor =
            AppColors.appTextFadedColor.withOpacity(0.8);

        //
        carRentalmainAndBorderColor = AppColors.appWhiteColor;
        boatCruisemainAndBorderColor = AppColors.appWhiteColor;
      }
    });
  }

  void _onCarRentalChange() {
    setState(() {
      isShorletSelected = false;
      isCarRentalSelected = true;
      isBoatCruiseSelected = false;

      if (isCarRentalSelected) {
        shorletTextAndIconColor = AppColors.appTextFadedColor.withOpacity(0.8);
        shorletmainAndBorderColor = AppColors.appWhiteColor;

        //
        carRentalTextAndIconColor = AppColors.appWhiteColor;
        boatCruiseTextAndIconColor =
            AppColors.appTextFadedColor.withOpacity(0.8);

        //
        carRentalmainAndBorderColor = AppColors.appMainColor;
        boatCruisemainAndBorderColor = AppColors.appWhiteColor;
      }
    });
  }

  void _onBoatCruiseChange() {
    setState(() {
      isShorletSelected = false;
      isCarRentalSelected = false;
      isBoatCruiseSelected = true;

      if (isBoatCruiseSelected) {
        shorletTextAndIconColor = AppColors.appTextFadedColor.withOpacity(0.8);
        shorletmainAndBorderColor = AppColors.appWhiteColor;

        //
        carRentalTextAndIconColor =
            AppColors.appTextFadedColor.withOpacity(0.8);
        boatCruiseTextAndIconColor = AppColors.appWhiteColor;

        //
        carRentalmainAndBorderColor = AppColors.appWhiteColor;
        boatCruisemainAndBorderColor = AppColors.appMainColor;
      }
    });
  }
}
