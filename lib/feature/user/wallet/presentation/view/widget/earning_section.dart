import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EarningSection extends StatelessWidget {
  const EarningSection({super.key, required this.today, required this.thisWeek, required this.thisMonth});
  final int today;
  final int thisWeek;
  final int thisMonth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.earning.tr(),
          style: StyleText.style18.copyWith(
            color: Colors.green.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
        sizeBox(),
        Row(
          children: [
            buildContainer(AppStrings.today.tr(), today),
            sizeBox(width: 10),
            buildContainer(AppStrings.thisWeek.tr(), thisWeek),
            sizeBox(width: 10),
            buildContainer(AppStrings.thisMonth.tr(), thisMonth),
          ],
        ),
      ],
    );
  }
  Widget buildContainer(String title, int price) => Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: StyleText.style13.copyWith(
              color: Colors.black45,
              fontWeight: FontWeight.w600,
            ),
          ),
          sizeBox(height: 10),
          Text(
            '${AppStrings.egp.tr()} $price',
            style: StyleText.style20().copyWith(
              color: AppColors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );

}
