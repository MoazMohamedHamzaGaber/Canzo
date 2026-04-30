import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomCardOverviewAdmin extends StatelessWidget {
  const CustomCardOverviewAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff722F37),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ADMIN BALANCE',
              style: StyleText.style13.copyWith(
                color: AppColors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'EGP 10,000',
                    style: StyleText.style40.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Total paid out',
                      style: StyleText.style16.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'EGP 400',
                      style: StyleText.style20().copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            sizeBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildItem(AppStrings.user.tr(), '1'),
                sizeBox(width: 10),
                buildItem('agent', '1'),
                sizeBox(width: 10),
                buildItem(AppStrings.pickups.tr(), '4'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(String title, String num) => Expanded(
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black12,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: StyleText.style13.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            num,
            style: StyleText.style26.copyWith(
              fontSize: 30,
              color: AppColors.lightScaffoldColor,
            ),
          ),
        ],
      ),
    ),
  );
}
