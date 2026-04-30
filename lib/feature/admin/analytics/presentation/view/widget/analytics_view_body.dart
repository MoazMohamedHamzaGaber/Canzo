import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/custom_app_bar.dart';
import 'package:canzo_app/feature/admin/analytics/presentation/view/widget/marerials_section.dart';
import 'package:canzo_app/feature/admin/analytics/presentation/view/widget/revenue_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AnalyticsViewBody extends StatelessWidget {
  const AnalyticsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: AppStrings.analytics.tr(),
              body: AppStrings.systemInsights.tr(),
            ),
            sizeBox(),
            const RevenueCard(),
            sizeBox(height: 40),
            const MaterialsCard(),
          ],
        ),
      ),
    );
  }
}