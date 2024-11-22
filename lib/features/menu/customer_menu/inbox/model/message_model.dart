class MessageModel {
  final String title;
  final String? subInformation;
  final String? body;
  final DateTime dateSent;
  MessageModel({
    required this.title,
    this.subInformation,
    this.body,
    required this.dateSent,
  });
}
