import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class QuickStatsSection extends StatelessWidget {
  const QuickStatsSection({super.key, required this.bidding, required this.cancel, required this.complete});
  final int bidding;
  final int cancel;
  final int complete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.quickStats.tr(),
          style: StyleText.style18.copyWith(
            color: Colors.green.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
        sizeBox(height: 10),
        Row(
          children: [
            buildContainer(AppStrings.bidding.tr(), bidding,AppStrings.pickups.tr()),
            sizeBox(width: 10),
            buildContainer(AppStrings.canceled.tr(), cancel, AppStrings.ongoing.tr()),
            sizeBox(width: 10),
            buildContainer(AppStrings.completed.tr(), complete, AppStrings.completed.tr()),
          ],
        ),
      ],
    );
  }
  Widget buildContainer(String title, int price,String state) => Expanded(
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
              color: Colors.black38,
              fontWeight: FontWeight.w600,
            ),
          ),
          sizeBox(height: 10),
          Text(
            '$price',
            style: StyleText.style26.copyWith(
              color: AppColors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          sizeBox(height: 10),
          // Text(
          //   state,
          //   style: StyleText.style13.copyWith(
          //     color: Colors.black38,
          //     fontWeight: FontWeight.w600,
          //   ),
        //  ),
        ],
      ),
    ),
  );

}
