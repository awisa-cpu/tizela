import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title, subtitle;
  final ValueChanged<bool> onExpansionChanged;
  List<Widget> children;
  final double? childrenPadding;
  CustomExpansionTile({
    super.key,
    required this.subtitle,
    required this.onExpansionChanged,
    required this.title,
    required this.children,
    this.childrenPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ExpansionTile(
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.centerLeft,
        childrenPadding: EdgeInsets.only(left: childrenPadding ?? 13.5),
        enableFeedback: false,
        title: Text(title),
        subtitle: Text(subtitle),
        onExpansionChanged: onExpansionChanged,
        children: children,
      ),
    );
  }
}
