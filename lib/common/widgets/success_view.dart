import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../../utils/device/app_device_services/app_device_services.dart';

class SuccessView extends StatefulWidget {
  final String mainText, subText;
  final VoidCallback? onPressed;
  final String? actionText, imageUrl;
  const SuccessView({
    super.key,
    required this.mainText,
    required this.subText,
    this.onPressed,
    this.actionText,
    this.imageUrl,
  });

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  @override
  void initState() {
    super.initState();

    AppDeviceServices.hideStatusBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.successScreenColor,
        child: Padding(
          padding: const EdgeInsets.all(13.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(widget.imageUrl ?? ImagesText.successImage),
              const CustomHeight(height: 20),
              Text(
                widget.mainText,
                style: customTextStyle(
                  color: AppColors.appWhiteColor,
                  fontSize: 18,
                ),
              ),
              const CustomHeight(height: 20),
              Text(
                widget.subText,
                textAlign: TextAlign.center,
                style: customTextStyle(
                  color: AppColors.appWhiteColor,
                  fontSize: 14,
                ),
              ),
              const CustomHeight(height: 20),
              CustomEleButton(
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    backgroundColor:
                        const WidgetStatePropertyAll(AppColors.appWhiteColor),
                    foregroundColor:
                        const WidgetStatePropertyAll(AppColors.appMainColor),
                    side: const WidgetStatePropertyAll(
                      BorderSide(color: AppColors.appWhiteColor),
                    )),
                onPressed: widget.onPressed != null
                    ? widget.onPressed!
                    : () => AppNagivator.pushNamedRoute(
                          context,
                          appMenuCustomerHomeRoute,
                        ),
                text: widget.actionText ?? "Go to homepage",
              )
            ],
          ),
        ),
      ),
    );
  }
}
