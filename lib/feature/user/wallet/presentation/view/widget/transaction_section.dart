import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/core/widget/empty_screen.dart';
import 'package:canzo_app/feature/user/wallet/presentation/cubit/wallet_state.dart';
import 'package:canzo_app/feature/user/wallet/presentation/view/widget/build_Item_transaction.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TransactionSection extends StatelessWidget {
  const TransactionSection({super.key, required this.state, required this.condition});

  final WalletState state;
  final bool condition;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.transaction.tr(),
          style: StyleText.style18.copyWith(
            color: Colors.green.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
        sizeBox(),
       condition? ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => BuildItemTransaction(
            name: 'Moaz',
            createAt: state.transaction!.allTransactions[index].createdAt,
            price: state.transaction!.allTransactions[index].amount,
          ),
          separatorBuilder: (context, index) => sizeBox(),
          itemCount: 20,
        ) :EmptyScreen(title: AppStrings.noTransaction.tr()),
      ],
    );
  }
}
