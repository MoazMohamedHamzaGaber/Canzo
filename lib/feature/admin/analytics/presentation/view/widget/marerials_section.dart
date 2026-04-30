import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/admin/analytics/presentation/view/widget/materials_progress_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MaterialsCard extends StatelessWidget {
  const MaterialsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text(
          AppStrings.mostCollection.tr(),
          style: StyleText.style16.copyWith(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        MaterialProgressItem(
          title: AppStrings.plastic.tr(),
          value: 0.75,
          amount: "11 pkg",
        ),

        SizedBox(height: 12),

        MaterialProgressItem(
          title: AppStrings.cans.tr(),
          value: 0.45,
          amount: "7 pkg",
        ),
      ],
    );
  }
}