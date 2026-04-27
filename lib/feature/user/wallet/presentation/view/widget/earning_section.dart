import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class EarningSection extends StatelessWidget {
  const EarningSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EARNINGS',
          style: StyleText.style18.copyWith(
            color: Colors.green.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
        sizeBox(),
        Row(
          children: [
            buildContainer('TODAY', 0),
            sizeBox(width: 10),
            buildContainer('THIS WEEK', 600),
            sizeBox(width: 10),
            buildContainer('THIS MONTH', 600),
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
            'EGP $price',
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
