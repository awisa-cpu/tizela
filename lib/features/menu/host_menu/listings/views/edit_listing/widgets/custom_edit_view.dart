import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/setup/app_navigator.dart';

class CustomEditView extends StatelessWidget {
  final Widget child;
  const CustomEditView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomScrollableLayoutWidget(
      padding: const EdgeInsets.only(
        top: 13.5,
        right: 13.5,
        left: 13.5,
        bottom: 26,
      ),
      child: CustomColumn(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => AppNagivator.goBack(),
              icon: const Icon(Icons.close),
            ),
          ),
          const CustomHeight(height: 20),
          child,
        ],
      ),
    );
  }
}
