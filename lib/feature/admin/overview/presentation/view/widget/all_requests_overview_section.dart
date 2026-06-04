import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/admin/overview/domain/entity/withdraw_entity.dart';
import 'package:canzo_app/feature/admin/overview/presentation/cubit/overview_state.dart';
import 'package:canzo_app/feature/admin/overview/presentation/view/widget/build_item_all_requests.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/widget/empty_screen.dart';

class AllRequestsOverviewSection extends StatelessWidget {
  const AllRequestsOverviewSection({
    super.key,
    required this.withdraw,
    required this.state,
  });

  final List<WithdrawalEntity> withdraw;
  final OverviewState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Withdraw Requests',
          style: StyleText.style18.copyWith(
            color: Colors.green.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
        sizeBox(height: 10),
        _buildContent(),
      ],
    );
  }
  Widget _buildContent() {
    if(state.status ==OverviewStates.success){
      if (withdraw.isEmpty) {
        return const EmptyScreen(
          title: 'No withdraw requests',
        );
      }
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: withdraw.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) => BuildItemAllRequests(
          withdraw: withdraw[index],
          state: state,
        ),
      );
    }
    if (state.status == OverviewStates.error) {
      return EmptyScreen(
        title: state.failure?.errMessage ?? 'Something went wrong',
      );
    }

    return SizedBox();
  }
}

