import 'package:canzo_app/core/utils/style.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: StyleText.style26,
        ),
        Text(
          body,
          textAlign: TextAlign.center,
          style: StyleText.style16,
        ),
      ],
    );
  }
}
