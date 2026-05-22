import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.balance});
  final int balance;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.green,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.availableBalance.tr(),
              style: StyleText.style13.copyWith(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${AppStrings.egp.tr()} $balance',
              style: StyleText.style40.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            // sizeBox(),
            // Row(
            //   children: [
            //     Expanded(
            //       child: GestureDetector(
            //         onTap: () {},
            //         child: Container(
            //           padding: EdgeInsets.all(15),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(12),
            //             color: Colors.green.shade300,
            //           ),
            //           child: Text(
            //             AppStrings.withdraw.tr(),
            //             textAlign: TextAlign.center,
            //             style: StyleText.style19.copyWith(
            //               color: Colors.white,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     sizeBox(),
            //     Expanded(
            //       child: GestureDetector(
            //         onTap: () {},
            //         child: Container(
            //           padding: EdgeInsets.all(15),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(12),
            //             color: Colors.black54,
            //           ),
            //           child: Text(
            //             AppStrings.send.tr(),
            //             textAlign: TextAlign.center,
            //             style: StyleText.style19.copyWith(
            //               color: Colors.white,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
