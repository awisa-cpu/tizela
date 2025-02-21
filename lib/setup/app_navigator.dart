import 'package:flutter/material.dart';
import 'package:tizela/features/auth/views/sign_in/user_create_new_password_view.dart';
import 'package:tizela/features/auth/views/sign_in/user_sign_in_view.dart';
import 'package:tizela/features/auth/views/sign_in/user_signin_check_view.dart';
import 'package:tizela/features/auth/views/sign_up/user_confirm_email_view.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/bookings_search_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/boat_cruise_search_result_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/car_rental_search_result_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/home_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/short_let_search_result_view.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/customer_service_view.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/boat_cruise/host_new_listing_boat_cruise_view.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/car_rental/host_new_listing_car_rental_view.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/shorlet/host_new_listing_shorlet_view.dart';
import 'package:tizela/features/onboarding/views/user_account_type_view.dart';
import 'package:tizela/features/onboarding/views/customer_authentication_type_view.dart';
import 'package:tizela/features/onboarding/views/onboarding_view.dart';
import 'package:tizela/setup/app_customer_menu.dart';
import 'package:tizela/setup/app_host_menu.dart';

///route names :Customer
const String userSignInRoute = "/signInRoute";
const String userCreatetNewPasswordRoute = "/newPasswordRoute";
const String signInCheckRoute = "/signInCheckRoute";
const String userConfirmEmailRoute = "/confirmEmailRoute";
const String userSAcountTypeRoute = "/accountTypeRoute";
const String customerAuthTypeRoute = "/authTypeRoute";
const String onboardingRoute = "/onboardingRoute";
const String homeRoute = "/homeRoute";
const String shortletResultRoute = "/shortletResultRoute";
const String boatCruiseResultRoute = "/boatCruiseResultRoute";
const String carRentalResultRoute = "/carRentalResultRoute";
const String appMenuCustomerHomeRoute = "/customerMenuHomeRoute";
const String bookingSearchRoute = "/bookingSearchRoute";
const String customerServiceRoute = "/customerServiceRoute";

///route names :Host
const String appMenuHostHomeRoute = "/hostMenuHomeRoute";
const String hostNewListingShorletRoute = "/hostNewListingShorletRoute";
const String hostNewListingCarRentalRoute = "/hostNewListingCarRentalRoute";
const String hostNewListingBoatCruiseRoute = "/hostNewListingBoatCruiseRoute";

class AppNagivator {

  //defined key to access the buildcontext from anywhere outside the widget tree
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  //
  static Map<String, WidgetBuilder> routes() {
    return {
      onboardingRoute: (context) => const OnboardingView(),
      userSAcountTypeRoute: (context) => const UserAccountTypeView(),
      customerAuthTypeRoute: (context) =>
          const CustomerAuthenticationTypeView(),
      signInCheckRoute: (context) => const UserSignInCheckView(),
      userConfirmEmailRoute: (context) => const UserConfirmationEmailView(),
      userSignInRoute: (context) => const UserSignInView(),
      userCreatetNewPasswordRoute: (context) =>
          const UserCreateNewPasswordView(),
      homeRoute: (context) => const HomeView(),
      shortletResultRoute: (context) => const ShortLetSearchResultView(),
      boatCruiseResultRoute: (context) => const BoatCruiseSearchResult(),
      carRentalResultRoute: (context) => const CarRentalSearchResult(),
      appMenuCustomerHomeRoute: (context) => const AppCustomerMenu(),
      appMenuHostHomeRoute: (context) => const AppHostMenu(),
      bookingSearchRoute: (context) => const BookingsSearchView(),
      customerServiceRoute: (context) => const CustomerServiceView(),
      hostNewListingShorletRoute: (context) =>
          const HostNewListingShorletView(),
      hostNewListingCarRentalRoute: (context) =>
          const HostNewListingCarRentalView(),
      hostNewListingBoatCruiseRoute: (context) =>
          const HostNewListingBoatCruiseView(),
    };
  }

  static void goBack() => 
  Navigator.pop(navigatorKey.currentContext!);

  static void pushNamedRoute(String routeName) => Navigator.pushNamed(navigatorKey.currentContext!, routeName);

  ///push the current route unto the stack
  static void pushRoute(Widget routeWidget) {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => routeWidget,
      ),
    );
  }

  static void pushAndRemovePreRoute(Widget route) {
    Navigator.pushReplacement(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => route,
      ),
    );
  }

  static void pushNamedAndRemoveAll(String newRouteName) {
    Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(
      newRouteName,
      (route) => false,
    );
  }
}
