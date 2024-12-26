import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/widgets/custom_contact_us_tab.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomContactUsServices extends StatelessWidget {
  const CustomContactUsServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        CustomContactUsTab(
          text: "Chat customer service",
          imageUrl: ImagesText.customerServiceLogo,
          onTap: () {
            AppNagivator.pushNamedRoute( customerServiceRoute);
          },
        ),
        CustomContactUsTab(
          text: "WhatsApp",
          imageUrl: ImagesText.whatsappLogo,
          onTap: () {},
        ),
        CustomContactUsTab(
          text: "Website",
          imageUrl: ImagesText.websiteLogo,
          onTap: () {},
        ),
        CustomContactUsTab(
          text: "Facebook",
          imageUrl: ImagesText.facebookLogo,
          onTap: () {},
        ),
        CustomContactUsTab(
          text: "Twitter",
          imageUrl: ImagesText.twitterLogo,
          onTap: () {},
        ),
        CustomContactUsTab(
          text: "Instagram",
          imageUrl: ImagesText.instagramLogo,
          onTap: () {},
        ),
      ],
    );
  }
}
