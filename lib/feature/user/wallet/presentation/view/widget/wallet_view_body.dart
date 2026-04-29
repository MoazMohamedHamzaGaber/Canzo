import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/custom_app_bar.dart';
import 'package:canzo_app/feature/user/wallet/presentation/view/widget/custom_card.dart';
import 'package:canzo_app/feature/user/wallet/presentation/view/widget/earning_section.dart';
import 'package:canzo_app/feature/user/wallet/presentation/view/widget/transaction_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WalletViewBody extends StatelessWidget {
  const WalletViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: AppStrings.wallet.tr(), body: AppStrings.yourEarn.tr()),
              sizeBox(),
              CustomCard(),
              sizeBox(),
              EarningSection(),
              sizeBox(),
              TransactionSection(),
            ],
          ),
        ),
      ),
    );
  }
}


