import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BuildItemCard extends StatelessWidget {
  const BuildItemCard({
    super.key,
    this.body = true,
    this.image = true,
    required this.title,
    required this.subtitle,
    required this.state,
  });

  final bool? body;
  final bool? image;
  final String title;
  final String subtitle;
  final String state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 12, bottom: 20, right: 12, left: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black45),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (image == true)
                Image.asset('assets/images/logo.jpg', width: 50, height: 50),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: StyleText.style19),
                  Text(subtitle, style: StyleText.style13),
                  if (body == true)
                    Text('27 Api 2026 - 07:09', style: StyleText.style13),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black45),
                    ),
                    child: Text(
                      state,
                      style: StyleText.style13.copyWith(
                        color: AppColors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('${AppStrings.egp.tr()} 300', style: StyleText.style19),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
