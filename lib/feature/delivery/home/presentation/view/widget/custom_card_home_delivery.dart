import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
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
              'TODAY\'S OVERVIEW',
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
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Assigned',
                        style: StyleText.style13.copyWith(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizeBox(height: 10),
                      Text('2',
                      style: StyleText.style26.copyWith(
                        fontSize: 40,
                        color: AppColors.lightScaffoldColor,
                      ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Completed today',
                        style: StyleText.style13.copyWith(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizeBox(height: 10),
                      Text('1',
                        style: StyleText.style26.copyWith(
                          fontSize: 40,
                          color: AppColors.lightScaffoldColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Volume',
                        style: StyleText.style13.copyWith(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizeBox(),
                      Text('EGP 900',
                        style: StyleText.style26.copyWith(
                          color: AppColors.lightScaffoldColor,
                        ),
                      ),
                    ],
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
