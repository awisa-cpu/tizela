import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';

class CustomBookingTab extends StatelessWidget {
  final double? width;
  final VoidCallback onTap;
  final String text;
  final Color textColor, tabColor;
  const CustomBookingTab({
    super.key,
    this.width = 100,
    required this.onTap,
    required this.text,
    required this.textColor,
    required this.tabColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: tabColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
        child: Text(
          text,
          style: customTextStyle(
            color: textColor,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
