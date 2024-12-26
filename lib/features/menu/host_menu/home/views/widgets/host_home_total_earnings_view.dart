import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_empty_data_view.dart';
import 'package:tizela/common/widgets/custom_listview.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_display_clip_image_with_size.dart';
import 'package:tizela/common/widgets/custom_header_sub_and_back_button.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class HostHomeTotalEarningsView extends StatefulWidget {
  const HostHomeTotalEarningsView({super.key});

  @override
  State<HostHomeTotalEarningsView> createState() =>
      _HostHomeTotalEarningsViewState();
}

class _HostHomeTotalEarningsViewState extends State<HostHomeTotalEarningsView> {
  final List<String> menuItems = ["This Month", "Last Month", "2 month ago"];
  bool isDataEmpty = true;
  String priceValue = "180,000";
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
            const CustomHeaderSubAndBackButton(
              headerText: "Earnings",
              isthereSubText: false,
            ),
            const CustomHeight(height: 30),
            CustomHostTotalEarningsTab(
              priceValue: priceValue,
            ),
            const CustomHeight(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  isDataEmpty = !isDataEmpty;
                  if (isDataEmpty) {
                    priceValue = "0.0";
                  } else {
                    priceValue = "180,000";
                  }
                });
              },
              child: const Text(
                "check data",
              ),
            ),
            const CustomHeight(height: 30),
            CustomHostTotalEarningsFilter(menuItems: menuItems),
            isDataEmpty
                ? const CustomEmptyDataView(
                    screenHeight: 0.40,
                    mainText: "No transaction",
                    subText:
                        "Lorem ipsum dolor sit amet consectetur. Quisque eget nunc pulvinar eu mauris.",
                  )
                : SizedBox(
                    height: context.screenHeight() * 0.7,
                    child: CustomListview(
                      isScrollable: true,
                      isDefaultSeperator: false,
                      isPaddingNeeded: false,
                      itemCount: 10,
                      itemBuilder: (_, index) {
                        return const CustomHostEarningsTransactionView();
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class CustomHostTotalEarningsTab extends StatelessWidget {
  final String priceValue;
  const CustomHostTotalEarningsTab({
    super.key,
    required this.priceValue,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      borderColor: AppColors.appTextFadedColor.withValues(alpha: 0.5),
      alignment: Alignment.center,
      width: context.screenWidth(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Total Stay Earning",
            style: customTextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.appTextFadedColor),
          ),
          const CustomHeight(height: 10),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: "#$priceValue", style: customTextStyle(fontSize: 30)),
                TextSpan(text: ".00", style: customTextStyle(fontSize: 15)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomHostEarningsTransactionView extends StatelessWidget {
  const CustomHostEarningsTransactionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      margin: const EdgeInsets.symmetric(vertical: 15),
      paddingNumber: 0.0,
      showBorder: false,
      child:
          //shorlet details
          Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomDisplayClipImageWithSize(
            imageUrl: ImagesText.lounge1,
          ),
          const CustomWidth(width: 10),

          //customer details
          Expanded(
            child: CustomColumn(
              children: [
                //name
                Text(
                  "Sunderam Boys  PG",
                  style: customTextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const CustomHeight(height: 5),
                Text(
                  "By Asuquo Godwin",
                  style: customTextStyle(
                    fontSize: 12,
                    color: AppColors.appTextFadedColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),

                const CustomHeight(height: 5),
                Text(
                  "17th June, 2024",
                  style: customTextStyle(
                    fontSize: 10,
                    color: AppColors.appMainColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          //cost
          Text(
            "#50,000",
            style: customTextStyle(
              fontSize: 14,
              color: Colors.green,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomHostTotalEarningsFilter extends StatelessWidget {
  const CustomHostTotalEarningsFilter({
    super.key,
    required this.menuItems,
  });

  final List<String> menuItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Transactions",
          style: customTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 100,
        ),
        Expanded(
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.appTextFadedColor))),
            enableFeedback: false,
            isExpanded: false,
            elevation: 2,
            value: "This Month",
            items: [...menuItems]
                .map((filter) =>
                    DropdownMenuItem(value: filter, child: Text(filter)))
                .toList(),
            onChanged: (newValue) {},
          ),
        )
      ],
    );
  }
}
