import 'package:flutter/material.dart';
import 'package:tizela/features/menu/host_menu/listings/views/widgets/custom_continue_and_save_exit_buttons.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

class CustomNewListingCreationBNB extends StatelessWidget {
  final VoidCallback onSave, onExit;
  const CustomNewListingCreationBNB({
    super.key,
    required this.onSave,
    required this.onExit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.5),
      child: SizedBox(
        height: context.screenHeight() * 0.17,
        child: CustomContinueAndSaveExitButtons(
          onContinue: onSave,
          onSaveAndExit: onExit,
        ),
      ),
    );
  }
}
