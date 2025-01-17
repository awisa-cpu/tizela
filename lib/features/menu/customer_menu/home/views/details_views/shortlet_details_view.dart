import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/customer_menu/bookings/controller/shortlet_bookings_controller.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/more_shorlet_images_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import '../../../../../../setup/app_navigator.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/device/app_device_services/app_device_services.dart';
import '../../../../../../utils/enums/booking_type.dart';
import '../../../../host_menu/listings/model/shortlet_model.dart';
import '../../../bookings/views/shortlet_bookings/shortlet_bookings_summary_view.dart';
import '../../../favourite/controller/customer_shortlet_favourite_controller.dart';
import 'widgets/custom_first_shorlet_details_section.dart';
import 'widgets/custom_map_view_section.dart';
import 'widgets/custom_shorlet_policies.dart';
import 'widgets/custom_second_shortlet_details_section.dart';
import 'widgets/custom_suggestions.dart';
import 'widgets/custom_third_shortlet_details_section.dart';

class ShortletDetailsView extends StatefulWidget {
  final ShortletModel shortLetItem;
  const ShortletDetailsView({super.key, required this.shortLetItem});

  @override
  State<StatefulWidget> createState() => _ShortletDetailsViewState();
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
    final CustomShortletFavouriteController controller =
        CustomShortletFavouriteController.instance;
    Get.put(ShortletBookingsController());

    //
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //section 1: Image and image qualities
            Stack(
              children: [
                CustomCachedNetworkImage(
                  networkImageUrl: widget.shortLetItem.apartmentImages.first,
                  imageHeigth: context.screenHeight() * 0.40,
                  imageWidth: context.screenWidth(),
                  fit: BoxFit.cover,
                ),
                //back button
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    onPressed: () => AppNagivator.goBack(),
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.appWhiteColor,
                    ),
                  ),
                ),
                //favourite
                Positioned(
                  right: 10,
                  top: 40,
                  child: Obx(
                    () => CustomFavourite(
                      onTap: () => controller.addOrRemoveFromShortletFavourites(
                        shortletId: widget.shortLetItem.uid!,
                      ),
                      color: controller.isAdded(widget.shortLetItem.uid!)
                          ? Colors.red
                          : null,
                    ),
                  ),
                ),
                //share
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
                    text: "${widget.shortLetItem.apartmentImages.length}",
                    onTap: () => AppNagivator.pushRoute(
                      const MoreShortletImagesView(),
                    ),
                  ),
                )
              ],
            ),

            //section 2:
            CustomScrollableLayoutWidget(
              padding: const EdgeInsets.only(
                  top: 13.5, left: 13.5, right: 13.5, bottom: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFirstShortletDetailsSection(
                    shortletItem: widget.shortLetItem,
                  ),
                  const CustomDivider(),
                  CustomSecondShortletDetailsSection(
                    shortlet: widget.shortLetItem,
                  ),
                  const CustomDivider(),
                  CustomThirdShortletDetailsSection(
                    story: widget.shortLetItem.anyStory,
                  ),
                  const CustomDivider(),
                  CustomShorletPolicies(
                    shortlet: widget.shortLetItem,
                  ),
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
                    text: "#${widget.shortLetItem.apartmentPrice.round()}",
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
                //if booking type is instant, go to booking summary
                if (widget.shortLetItem.bookingType == BookingType.instant) {
                  AppNagivator.pushRoute(
                    ShorletBookingsSummaryView(
                      shortlet: widget.shortLetItem,
                    ),
                  );
                  return;
                }
                //if booking type is not instant, do something else
              },
              child: Text(
                widget.shortLetItem.bookingType == BookingType.instant
                    ? "Book now"
                    : "Reserve stay",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
