import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/widgets.dart';

class CustomContinueAndSaveExitButtons extends StatelessWidget {
  final VoidCallback onContinue, onSaveAndExit;
  const CustomContinueAndSaveExitButtons({
    super.key,
    required this.onContinue,
    required this.onSaveAndExit,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 15),
          child: CustomEleButton(
            onPressed: onContinue,
            text: "Save",
          ),
        ),
        CustomCenterTextButton(
          actionText: "Exit",
          onTap: onSaveAndExit,
        ),
      ],
    );
  }
}
