import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/admin/overview/presentation/view/widget/build_item_pending_approvals.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PendingApprovals extends StatelessWidget {
  const PendingApprovals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                AppStrings.pendingApproval.tr(),
                style: StyleText.style18.copyWith(
                  color: Colors.green.shade500,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
             '2 ${AppStrings.newItem.tr()}',
              style: StyleText.style13.copyWith(
                color: Colors.green.shade500,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        sizeBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index)=>BuildItemPendingApprovals(),
          separatorBuilder: (context,index)=>sizeBox(),
          itemCount: 2,
        ),
      ],
    );
  }
}
