import 'package:flutter/material.dart';

class CustomEleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final ButtonStyle? style;
  const CustomEleButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: style,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
