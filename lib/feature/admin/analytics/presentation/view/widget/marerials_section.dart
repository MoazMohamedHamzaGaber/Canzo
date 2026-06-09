import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/admin/analytics/presentation/view/widget/materials_progress_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/analytic_entity.dart';

class MaterialsCard extends StatelessWidget {
  final AnalyticsEntity analytics;

  const MaterialsCard({
    super.key,
    required this.analytics,
  });

  @override
  Widget build(BuildContext context) {
    final totalWeight =
        analytics.plasticWeight + analytics.canzWeight;

    final plasticPercent =
    totalWeight == 0
        ? 0
        : analytics.plasticWeight / totalWeight;

    final cansPercent =
    totalWeight == 0
        ? 0
        : analytics.canzWeight / totalWeight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.mostCollection.tr(),
          style: StyleText.style16.copyWith(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 16),

        MaterialProgressItem(
          title: AppStrings.plastic.tr(),
          value: plasticPercent.toDouble(),
          amount: "${analytics.plasticWeight} ${AppStrings.kg.tr()}",
        ),

        const SizedBox(height: 12),

        MaterialProgressItem(
          title: AppStrings.cans.tr(),
          value: cansPercent.toDouble(),
          amount: "${analytics.canzWeight} ${AppStrings.kg.tr()}",
        ),
      ],
    );
  }
}