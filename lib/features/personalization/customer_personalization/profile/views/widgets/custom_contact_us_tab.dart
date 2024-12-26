import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';

class CustomContactUsTab extends StatelessWidget {
  final String text, imageUrl;
  final VoidCallback onTap;
  const CustomContactUsTab({
    super.key,
    required this.text,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: CustomScrollableLayoutWidget(
          child: CustomColumn(
            children: [
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 1,
                child: CustomRoundedEdgedContainer(
                  borderRadius: 10,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(1, 2),
                      color: Colors.grey.withValues(alpha: 0.1),
                      spreadRadius: 7,
                      blurRadius: 5,
                    )
                  ],
                  showBorder: false,
                  child: Row(
                    children: [
                      Image.asset(imageUrl),
                      const CustomWidth(width: 10),
                      Text(
                        text,
                        style: customTextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
