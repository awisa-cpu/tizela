import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/setup/app_navigator.dart';

import '../widgets/custom_search_location.dart';

class CustomSearchBoatCruiseView extends StatelessWidget {
  const CustomSearchBoatCruiseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Search",
          style: customTextStyle(fontSize: 16),
        ),
      ),
      body: CustomSearchLocation(
        locationText: "Location or Boat type",
        controllerText: "Enter location / boat type",
        eleButtonText: "Continue",
        onEleButtonPressed: () => AppNagivator.pushNamedRoute(
          context,
          boatCruiseResultRoute,
        ),
      ),
    );
  }
}
