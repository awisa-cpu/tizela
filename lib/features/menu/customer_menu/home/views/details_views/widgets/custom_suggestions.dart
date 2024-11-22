import 'package:flutter/material.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/custom_place_suggestion.dart';

class CustomSuggestions extends StatelessWidget {
  const CustomSuggestions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        CustomPlaceSuggestion(
          placeText: "Rumors 5 star restaurant",
          driveText: "8 mins drive",
        ),
        CustomPlaceSuggestion(
          placeText: "Jose bar restaurant",
          driveText: "12 mins drive",
        ),
        CustomPlaceSuggestion(
          placeText: "Ramos event place",
          driveText: "18 mins drive",
        ),
        CustomPlaceSuggestion(
          placeText: "Ricky's place",
          driveText: "24 mins drive",
        ),
      ],
    );
  }
}
