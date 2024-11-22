import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/setup/setup.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

class EditHostSetupPrice extends StatefulWidget {
  final String title;
  final Form formWidget;
  const EditHostSetupPrice(
      {super.key, required this.title, required this.formWidget});

  @override
  State<EditHostSetupPrice> createState() => _EditHostSetupPriceState();
}

class _EditHostSetupPriceState extends State<EditHostSetupPrice> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollLayoutWidget(
        padding: EdgeInsets.only(
          top: context.appBarHeight(),
          bottom: 13.5,
          left: 13.5,
          right: 13.5,
        ),
        child: CustomColumn(
          children: [
            CustomHeaderSubAndBackButton(
              headerText: "Set price",
              subText: "You can change price at anytime",
              onTap: () => AppNagivator.goBack(context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomColumn(
                children: [
                  Text(
                    widget.title,
                    style: customTextStyle(),
                  ),
                  const CustomHeight(),
                  widget.formWidget,
               
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
