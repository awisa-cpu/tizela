import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class AppPaymentService {

  //todo save this to the .env file
  static String stripePublishableKey =
      // dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? "";
      "pk_test_51Qh7bcIEVz5RoGju1HInWEwaLYugAduiUCYFudHw6j47nSed1Xk2FvIR3KKhGwE6YbVAsDnfBLae0iADPThshzou00fF4d592a";
  final String stripeSecretKey =
      // dotenv.env['STRIPE_SECRET_KEY'] ?? "";
      "sk_test_51Qh7bcIEVz5RoGjuY5gDp3hmyRdQKMJSSYgF3y5aqsrCcPz3Xf0OXcnm8QmB4zqOjHwgieDFB3rWjsRK2KcDTndS003s2W08Id";

//to create a singleton class
  AppPaymentService._();
  static final AppPaymentService _instance = AppPaymentService._();
  factory AppPaymentService() => _instance;

  Future<Map<String, dynamic>?> makePayment({required int amount}) async {
    try {
      //retrieve client secret key
      final String? paymentIntentClientSecretKey = await _createPaymentIntent(
        currency: "ngn",
        amount: amount,
      );
      if (paymentIntentClientSecretKey == null) {
        throw Exception("Invalid-client-secret key");
      }

      //init payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecretKey,
          merchantDisplayName: "Awisa Destiny",
        ),
      );

      //present payment sheet
      await _processPayment();

      //retrieve payment details
      final paymentIntent = await _retrievePaymentIntent(
        clientSecretKey: paymentIntentClientSecretKey,
      );

      return paymentIntent;
    } catch (e) {
      rethrow;
    }
  }

//this should be done in the server side and the client_secret_key should be returned to the client code
  Future<String?> _createPaymentIntent({
    required String currency,
    required int amount,
  }) async {
    try {
      //
      final Dio dio = Dio();
      final Map<String, dynamic> data = {
        "amount": _calculateAmount(amount),
        "currency": currency,
      };

      final response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": "application/x-www-form-urlencoded",
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        return response.data["client_secret"];
      }

      return null;
    } on DioException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      rethrow;
    }
  }

  String _calculateAmount(int amount) => (amount * 100).toString();

  Future<Map<String, dynamic>?> _retrievePaymentIntent(
      {required String clientSecretKey}) async {
    try {
      final String paymentIntentId = clientSecretKey.split("_secret")[0];

      final Dio dio = Dio();
      final response = await dio.get(
        "https://api.stripe.com/v1/payment_intents/$paymentIntentId",
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": "application/x-www-form-urlencoded",
          },
        ),
      );

      if (response.statusCode == 200) {
        final paymentIntentDetails = response.data as Map<String, dynamic>;
        return paymentIntentDetails;
      }

      return null;
    } catch (e) {
      rethrow;
    }
  }
}
