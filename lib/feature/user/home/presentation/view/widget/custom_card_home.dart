import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomCardHome extends StatelessWidget {
  const CustomCardHome({super.key});

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
              'WALLET BALANCE',
              style: StyleText.style13.copyWith(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'EGP 250',
              style: StyleText.style40.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizeBox(),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Text(
                        'Total earned ',
                        style: StyleText.style13.copyWith(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'EGP 600',
                        style: StyleText.style13.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                sizeBox(),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.green.shade300,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'View',
                            textAlign: TextAlign.center,
                            style: StyleText.style19.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Icon(Icons.arrow_right_alt_rounded,color: Colors.white,)
                        ],
                      ),
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
