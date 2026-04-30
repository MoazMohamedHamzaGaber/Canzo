import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomCardHomeDelivery extends StatelessWidget {
  const CustomCardHomeDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.green,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.todayOverview.tr(),
              style: StyleText.style13.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizeBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildItem(AppStrings.assigned.tr(), '2'),
                buildItem(AppStrings.completedToday.tr(), '1'),
                buildItem(
                  AppStrings.volume.tr(),
                  '${AppStrings.egp.tr()} 900',
                  height: 20,
                  fontSize: 26,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(
    String title,
    String num, {
    double? height,
    double? fontSize,
  }) => Expanded(
    child: Column(
      children: [
        Text(
          title,
          style: StyleText.style13.copyWith(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
        sizeBox(height: height ?? 10),
        Text(
          num,
          style: StyleText.style26.copyWith(
            fontSize: fontSize ?? 40,
            color: AppColors.lightScaffoldColor,
          ),
        ),
      ],
    ),
  );
}
