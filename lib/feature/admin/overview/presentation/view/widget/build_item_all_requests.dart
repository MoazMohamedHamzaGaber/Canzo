import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/admin/overview/domain/entity/withdraw_entity.dart';
import 'package:canzo_app/feature/admin/overview/domain/useCase/approve_withdraw_use_case.dart';
import 'package:canzo_app/feature/admin/overview/presentation/cubit/overview_state.dart';
import 'package:canzo_app/feature/admin/overview/presentation/view/widget/withdraw_details_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:canzo_app/feature/admin/overview/presentation/cubit/overview_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildItemAllRequests extends StatelessWidget {
  final WithdrawalEntity withdraw;
  final OverviewState state;

  const BuildItemAllRequests({
    super.key,
    required this.withdraw,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, WithdrawalDetailsView(withdrawal: withdraw));
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 20,
          right: 12,
          left: 12,
        ),
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        withdraw.userName,
                        style: StyleText.style19.copyWith(fontSize: 20),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${AppStrings.walletNumber.tr()}: ${withdraw.walletNumber}',
                        style: StyleText.style19.copyWith(fontSize: 17),
                      ),
                      SizedBox(height: 5),
                      Text(withdraw.createdAt, style: StyleText.style13),
                    ],
                  ),
                ),
                Text(
                  '${withdraw.amount.ceil()} ${AppStrings.egp.tr()}',
                  style: StyleText.style19.copyWith(fontSize: 17),
                ),
              ],
            ),

            sizeBox(),

            Row(
              children: [
                Expanded(
                  child: buildMaterialButton(
                    text: AppStrings.reject.tr(),
                    color: Colors.red,
                    loading:
                    state.loadingWithdrawId == withdraw.id &&
                        state.loadingAction == 'Rejected',
                    function: () {
                      context.read<OverviewCubit>().approveWithdraw(
                        context,
                        ApproveWithdrawParams(
                          withdrawId: withdraw.id,
                          status: 'Rejected',
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: buildMaterialButton(
                    text: AppStrings.approved.tr(),
                    color: AppColors.green,
                    loading:
                    state.loadingWithdrawId == withdraw.id &&
                        state.loadingAction == 'Approved',
                    function: () {
                      context.read<OverviewCubit>().approveWithdraw(
                        context,
                        ApproveWithdrawParams(
                          withdrawId: withdraw.id,
                          status: 'Approved',
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
