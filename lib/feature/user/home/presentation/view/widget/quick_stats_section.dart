import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class QuickStatsSection extends StatelessWidget {
  const QuickStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'QUICK STATS',
          style: StyleText.style18.copyWith(
            color: Colors.green.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
        sizeBox(height: 10),
        Row(
          children: [
            buildContainer('TOTALS', 4,'pickups'),
            sizeBox(width: 10),
            buildContainer('ACTIVE', 2, 'ongoing'),
            sizeBox(width: 10),
            buildContainer('DONE', 2, 'completed'),
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
          Text(
            state,
            style: StyleText.style13.copyWith(
              color: Colors.black38,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );

}
