import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/admin/overview/domain/entity/withdraw_entity.dart';
import 'package:canzo_app/feature/admin/overview/presentation/view/widget/build_item_all_requests.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/widget/empty_screen.dart';

class AllRequestsOverviewSection extends StatelessWidget {
  const AllRequestsOverviewSection({super.key, required this.withdraw});
  final List<WithdrawalEntity> withdraw;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Request Withdraw',
          style: StyleText.style18.copyWith(
            color: Colors.green.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
        sizeBox(height: 10),
        withdraw.isEmpty
            ? const EmptyScreen(title: 'No withdraw request')
            :ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index)=>BuildItemAllRequests(withdraw: withdraw[index],),
          separatorBuilder: (context,index)=>SizedBox(),
          itemCount: withdraw.length,
        ),
      ],
    );
  }
}
