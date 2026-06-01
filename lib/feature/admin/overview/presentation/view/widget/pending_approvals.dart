import 'package:canzo_app/core/service/service_locator.dart';
import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/admin/overview/presentation/view/widget/build_item_pending_approvals.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/overview_cubit.dart';
import '../../cubit/overview_state.dart';

class PendingApprovals extends StatelessWidget {
  const PendingApprovals({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>serviceLocator<OverviewCubit>()..getOrders(),
      child: BlocConsumer<OverviewCubit, OverviewState>(
        listener: (BuildContext context, OverviewState state) {
          if(state.status ==OverviewStates.updateSuccess){

          }
        },
        builder: (context, state) {
          if (state.orders.isEmpty) {
            return const SizedBox();
          }

          final pendingOrders = state.orders
              .where((e) => e.status == 'Pending')
              .toList();

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
                    "${pendingOrders.length} ${AppStrings.newItem.tr()}",
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
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pendingOrders.length,
                separatorBuilder: (_, __) => sizeBox(),
                itemBuilder: (context, index) {
                  return BuildItemPendingApprovals(order: pendingOrders[index]);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
