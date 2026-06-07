import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/core/widget/empty_screen.dart';
import 'package:canzo_app/feature/user/wallet/presentation/cubit/wallet_state.dart';
import 'package:canzo_app/feature/user/wallet/presentation/view/widget/build_Item_transaction.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TransactionSection extends StatelessWidget {
  const TransactionSection({super.key, required this.state});

  final WalletState state;

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
        sizeBox(height: 15),
       state.withdraw!.isNotEmpty? ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => BuildItemTransaction(withdraw: state.withdraw![index],),
          separatorBuilder: (context, index) => sizeBox(height: 8),
          itemCount: state.withdraw?.length ??0,
        ) :EmptyScreen(title: AppStrings.noTransaction.tr()),
      ],
    );
  }
}
