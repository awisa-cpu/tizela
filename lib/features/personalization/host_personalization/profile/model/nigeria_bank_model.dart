// ignore_for_file: public_member_api_docs, sort_constructors_first
class NigeriaBankModel {
  final String name;
  final bool payWithBank;
  final bool supportsTransfer;
  final String currency;
  NigeriaBankModel({
    required this.name,
    required this.payWithBank,
    required this.supportsTransfer,
    required this.currency,
  });

  factory NigeriaBankModel.fromJson(Map<String, dynamic> json) {
    return NigeriaBankModel(
      name: json['name'] as String,
      payWithBank: json['pay_with_bank'] as bool,
      supportsTransfer: json['supports_transfer'] as bool,
      currency: json['currency'] as String,
    );
  }
}
