import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import 'package:tizela/utils/device/app_device_services.dart';

class HostListingDetailsView extends StatelessWidget {
  final VoidCallback onSearchTap;
  final Widget child;
  const HostListingDetailsView({
    super.key,
    required this.onSearchTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollLayoutWidget(
        padding: EdgeInsets.symmetric(
          vertical: AppDeviceServices.getAppBarHeight(context),
          horizontal: 13.5,
        ),
        child: CustomColumn(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomHeaderSubAndBackButton(
                  headerText: "Listing details",
                  isthereSubText: false,
                ),
                GestureDetector(
                  onTap: onSearchTap,
                  child: Image.asset(ImagesText.searchIcon),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 13.5),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
