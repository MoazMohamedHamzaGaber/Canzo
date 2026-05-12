import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/admin/overview/presentation/view/widget/show_diaglog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BuildItemPendingApprovals extends StatelessWidget {
  const BuildItemPendingApprovals({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, bottom: 20, right: 12, left: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black45),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Moaz Mohamed', style: StyleText.style19, maxLines: 2),
                  Text(
                    '3 packages - plastic - Haram, Giza',
                    style: StyleText.style13,
                  ),
                  Text('27 Api 2026 - 07:09', style: StyleText.style13),
                ],
              ),
              Text(
                '${AppStrings.egp.tr()} 300',
                style: StyleText.style18.copyWith(color: AppColors.green),
              ),
            ],
          ),
          sizeBox(),
          buildMaterialButton(
            text: AppStrings.check.tr(),
            function: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  insetPadding: EdgeInsets.all(4),
                  child: SizedBox(
                    width: double.infinity,
                    child: AssignAgentDialog(),
                  ),
                ),
              );
            },
            color: AppColors.green,
          ),
        ],
      ),
    );
  }
}

