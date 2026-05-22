import 'package:canzo_app/core/service/service_locator.dart';
import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/custom_app_bar.dart';
import 'package:canzo_app/core/widget/snake_bar.dart';
import 'package:canzo_app/feature/user/history/presentation/cubit/history_cubit.dart';
import 'package:canzo_app/feature/user/history/presentation/cubit/history_state.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_cubit.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_state.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/baskets_section.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/custom_card_home.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/pickup_request.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/quick_stats_section.dart';
import 'package:canzo_app/feature/user/wallet/presentation/cubit/wallet_cubit.dart';
import 'package:canzo_app/feature/user/wallet/presentation/cubit/wallet_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              serviceLocator<HomeCubit>()..getBaskets(context),
        ),
        BlocProvider(
          create: (BuildContext context) => serviceLocator<HistoryCubit>()
            ..getBaskets(context, 'Pending')
            ..getBaskets(context, 'Cancelled')
            ..getBaskets(context, 'Completed'),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              serviceLocator<WalletCubit>()..getWallet(context),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (BuildContext context, HomeState state) async {
          if (state.status == HomeStates.fillSuccess) {
            showSnackBar(
              context: context,
              message: 'Basket filled successfully',
            );
          }
        },
        builder: (BuildContext context, state) {
          final history = context.watch<HistoryCubit>().state;
          final wallet = context.watch<WalletCubit>().state;

          if (state.status == HomeStates.loading ||
              history.status == HistoryStates.loading ||
              wallet.status == WalletStates.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(
                      title: '${AppStrings.hi.tr()}, Moaz',
                      body: AppStrings.letsRecycle.tr(),
                    ),
                    sizeBox(),
                    CustomCardHome(price: wallet.wallet?.balance ?? 0),
                    sizeBox(),
                    PickupRequestView(),
                    sizeBox(),
                    QuickStatsSection(
                      bidding: history.pendingOrders?.length ?? 0,
                      cancel: history.cancelledOrders?.length ?? 0,
                      complete: history.completedOrders?.length ?? 0,
                    ),
                    sizeBox(),
                    BasketsSection(state: state),
                    // sizeBox(),
                    // ActiveRequests(),
                    // sizeBox(),
                    // ResentPickupSection(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
