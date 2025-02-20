import "dart:convert";

import "package:http/http.dart" as http;

import "../../../features/personalization/host_personalization/profile/model/nigeria_bank_model.dart";

class NigeriaBanksApiService {
  static const String baseUrl = 'https://api.paystack.co/bank';
  //todo: this should be done from the server and if it is from the frontend, then it must be hidden
  final String secretKey = 'sk_test_3a47f9974db5d8a21f1e3f1b2e03a5b7df03a562';

  Future<List<NigeriaBankModel>> getAllSupportedNigeriaBanks() async {
    try {
      final response = await http.get(Uri.parse(baseUrl), headers: {
        "Authorization": "Bearer $secretKey",
        "Content-Type": "application/json",
      });

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body) as Map<String, dynamic>;
        final List<NigeriaBankModel> nigeriaBanks = (responseBody["data"]
                as List<dynamic>)
            .map((e) => NigeriaBankModel.fromJson(e as Map<String, dynamic>))
            .toList();

        return nigeriaBanks;
      } else {
        throw Exception('Failed to load Nigeria Banks');
      }
    } catch (e) {
      rethrow;
    }
  }
}
