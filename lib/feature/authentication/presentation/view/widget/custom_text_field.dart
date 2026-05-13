import 'package:flutter/material.dart';

import '../../../../../core/utils/components.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.name,
    required this.validate,
    required this.type, this.obscureText = false, this.icon
  });

  final TextEditingController controller;
  final String title;
  final String name;
  final String validate;
  final TextInputType type;
  final  bool obscureText;
  final  IconButton? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(title),
        ),
        buildTextField(
          context: context,
          obscureText:  obscureText,
          controller: controller,
          title: name,
          keyboardType: type,
          validate: validate,
          icon: icon
        ),
      ],
    );
  }
}
