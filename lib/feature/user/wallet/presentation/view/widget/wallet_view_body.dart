import 'package:canzo_app/core/service/service_locator.dart';
import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/custom_app_bar.dart';
import 'package:canzo_app/core/widget/empty_screen.dart';
import 'package:canzo_app/feature/user/wallet/presentation/cubit/wallet_cubit.dart';
import 'package:canzo_app/feature/user/wallet/presentation/cubit/wallet_state.dart';
import 'package:canzo_app/feature/user/wallet/presentation/view/widget/custom_card.dart';
import 'package:canzo_app/feature/user/wallet/presentation/view/widget/earning_section.dart';
import 'package:canzo_app/feature/user/wallet/presentation/view/widget/transaction_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletViewBody extends StatelessWidget {
  const WalletViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocProvider(
          create: (BuildContext context) =>
              serviceLocator<WalletCubit>()..load(context),
          child: BlocBuilder<WalletCubit, WalletState>(
            builder: (BuildContext context, state) {
              if (state.wallet != null && state.transaction != null) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(
                        title: AppStrings.wallet.tr(),
                        body: AppStrings.yourEarn.tr(),
                      ),
                      sizeBox(),
                      CustomCard(balance: state.wallet?.balance ?? 0),
                      sizeBox(),
                      EarningSection(
                        today: state.transaction!.todayTransactions.length,
                        thisWeek:
                            state.transaction!.lastWeekTransactions.length,
                        thisMonth:
                            state.transaction!.lastMonthTransactions.length,
                      ),
                      sizeBox(),
                      TransactionSection(
                        state: state,
                        condition:
                            state.transaction!.allTransactions.isNotEmpty,
                      ),
                    ],
                  ),
                );
              } else if (state.status == WalletStates.error) {
                return EmptyScreen(title: state.failure!.errMessage);
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
