import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_favourite.dart';
import 'package:tizela/common/widgets/custom_share.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/shortlet_bookings_summary_view.dart';
import 'package:tizela/features/menu/customer_menu/home/model/shorlet_model_xxxxx.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/more_shorlet_images_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/device/app_device_services.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import '../../../../../../common/widgets/custom_divider.dart';
import 'widgets/custom_first_shorlet_details_section.dart';
import 'widgets/custom_map_view_section.dart';
import 'widgets/custom_shorlet_policies.dart';
import 'widgets/custom_second_shortlet_details_section.dart';
import 'widgets/custom_suggestions.dart';
import 'widgets/custom_third_shortlet_details_section.dart';

class ShortletDetailsView extends StatefulWidget {
  final ShortletModelxxxxxxxxxxxxxxxx shortLetItem;
  const ShortletDetailsView({super.key, required this.shortLetItem});

  @override
  State<ShortletDetailsView> createState() => _ShortletDetailsViewState();
}

class _ShortletDetailsViewState extends State<ShortletDetailsView> {
  @override
  void initState() {
    super.initState();
    AppDeviceServices.hideStatusBar();
  }

  @override
  void dispose() {
    AppDeviceServices.restoreStatusBar();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollLayoutWidget(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image and image qualities
            Stack(
              children: [
                SizedBox(
                  height: context.screenHeight() * 0.40,
                  width: context.screenWidth(),
                  child: Image.asset(
                    widget.shortLetItem.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                //back button
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    onPressed: () => AppNagivator.goBack(context),
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.appWhiteColor,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 40,
                  child: CustomFavourite(
                    onTap: () {},
                  ),
                ),
                Positioned(
                  right: 60,
                  top: 40,
                  child: CustomShare(
                    onTap: () {},
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: CustomIconAndText(
                    imageIcon: ImagesText.galleryIcon,
                    text: "${widget.shortLetItem.imagesCount}",
                    textStyle: const TextStyle(color: Colors.white),
                    color: Colors.black.withOpacity(0.6),
                    onTap: () => AppNagivator.pushRoute(
                      context,
                      (context) {
                        return const MoreShortletImagesView();
                      },
                    ),
                  ),
                )
              ],
            ),
            CustomScrollLayoutWidget(
              padding: const EdgeInsets.only(
                  top: 13.5, left: 13.5, right: 13.5, bottom: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFirstShortletDetailsSection(
                    shortletItem: widget.shortLetItem,
                  ),
                  const CustomDivider(),
                  const CustomSecondShortletDetailsSection(),
                  const CustomDivider(),
                  const CustomThirdShortletDetailsSection(),
                  const CustomDivider(),
                  const CustomShorletPolicies(),
                  const CustomDivider(),
                  const CustomMapViewSection(),
                  const CustomSuggestions(),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13.5),
        height: context.screenHeight() * 0.10,
        width: context.screenWidth(),
        color: AppColors.appWhiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //cost
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "#50,000",
                    style: customTextStyle(
                      color: AppColors.appMainColor,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: "/ per night",
                    style: customTextStyle(
                        color: AppColors.appMainColor,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                AppNagivator.pushRoute(
                  context,
                  (_) => ShorletBookingsSummaryView(
                    shortlet: widget.shortLetItem,
                  ),
                );
              },
              child: const Text("Book now"),
            ),
          ],
        ),
      ),
    );
  }
}
