import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class SearchResultView extends StatelessWidget {
  final String imageIcon, title, mainText;
  final String? subText;
  final Widget listPackages;
  final VoidCallback onTapFilter;
  const SearchResultView({
    super.key,
    required this.imageIcon,
    required this.title,
    required this.mainText,
    this.subText,
    required this.listPackages,
    required this.onTapFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imageIcon,
              color: AppColors.appMainColor,
            ),
            const CustomWidth(width: 7),
            Text(
              title,
              style: customTextStyle(fontSize: 16),
            )
          ],
        ),
      ),
      body: CustomScrollableLayoutWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //first section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: AppColors.appWhiteColor,
                      borderRadius: BorderRadius.circular(45),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: subText != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                mainText,
                                style: customTextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                subText!,
                                style: customTextStyle(
                                  fontSize: 11,
                                  color: AppColors.appTextFadedColor,
                                  fontWeight: FontWeight.normal,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          )
                        : Text(
                            mainText,
                            style: customTextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                  ),
                ),
                const CustomWidth(width: 17),
                GestureDetector(
                  onTap: onTapFilter,
                  child: Image.asset(
                    ImagesText.filterIcon,
                  ),
                ),
              ],
            ),

            const CustomHeight(height: 20),

            listPackages
          ],
        ),
      ),
    );
  }
}
