import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/request_withdraw_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomCardHome extends StatelessWidget {
  const CustomCardHome({super.key, required this.price});

  final int price;

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
              AppStrings.walletBalance.tr(),
              style: StyleText.style13.copyWith(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${AppStrings.egp.tr()} $price',
              style: StyleText.style40.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizeBox(height: 10),
            // Row(
            //   children: [
            //     Expanded(
            //       flex: 2,
            //       child: Row(
            //         children: [
            //           Text(
            //             '${AppStrings.totalEarned.tr()} ',
            //             style: StyleText.style13.copyWith(
            //               color: Colors.white70,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           Text(
            //             '${AppStrings.egp.tr()} 600',
            //             style: StyleText.style13.copyWith(
            //               color: Colors.white,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    navigateTo(context, WithdrawRequestView());
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.green.shade300,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Request Withdraw',
                          textAlign: TextAlign.center,
                          style: StyleText.style18.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        sizeBox(
                          width: 4
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
