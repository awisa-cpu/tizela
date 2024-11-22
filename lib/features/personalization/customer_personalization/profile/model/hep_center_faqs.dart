class HelpCenterFaqsModel {
  final String title;
  final String? body;
  bool isExpanded;

  HelpCenterFaqsModel({
    required this.title,
    this.body,
    this.isExpanded = false,
  });
}
