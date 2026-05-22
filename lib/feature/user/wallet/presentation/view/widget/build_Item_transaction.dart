import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BuildItemTransaction extends StatelessWidget {
  const BuildItemTransaction({
    super.key,
    required this.name,
    required this.createAt,
    required this.price,
  });

  final String name;
  final String createAt;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 12, bottom: 20, right: 12, left: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black45),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_upward_rounded,
                  size: 16,
                  color: AppColors.green,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Transform',
                          style: StyleText.style19.copyWith(
                            color: AppColors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(createAt, style: StyleText.style13),
                      ],
                    ),
                    Spacer(),
                    Text(
                      '+${AppStrings.egp.tr()} $price',
                      style: StyleText.style19,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
