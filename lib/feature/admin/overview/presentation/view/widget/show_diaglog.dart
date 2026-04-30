import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AssignAgentDialog extends StatelessWidget {
  const AssignAgentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    AppStrings.close.tr(),
                    style: StyleText.style20(color: AppColors.green),
                  ),
                ),
              ),
            ],
          ),
          sizeBox(),
          Text(
            AppStrings.details.tr(),
            style: StyleText.style20(color: AppColors.green),
          ),
          sizeBox(),
          buildItem(AppStrings.requestNumber.tr(), "req-1001"),
          buildItem(AppStrings.owner.tr(), "Moaz mohamed"),
          buildItem(AppStrings.address.tr(), "Haram, Giza"),
          buildItem(AppStrings.basketNumber.tr(), "5pkg"),
          buildItem(AppStrings.basketType.tr(), "Plastic"),
          buildItem(AppStrings.price.tr(), "EGP 300"),
          buildItem(AppStrings.date.tr(), '27 Api 2026 - 07:09'),

          sizeBox(),

          buildMaterialButton(
            text: AppStrings.assignAgent.tr(),
            function: () {},
            color: AppColors.green,
          ),
        ],
      ),
    );
  }
}
Widget buildItem(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
            ),
          ),
        ),
        Text(value,
          style: StyleText.style18.copyWith(color: AppColors.green),
        ),
      ],
    ),
  );
}