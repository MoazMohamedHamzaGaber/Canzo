import 'package:canzo_app/core/service/service_locator.dart';
import 'package:canzo_app/feature/user/history/presentation/cubit/history_cubit.dart';
import 'package:canzo_app/feature/user/history/presentation/view/widget/bidding_history_view.dart';
import 'package:canzo_app/feature/user/history/presentation/view/widget/canceled_history_view.dart';
import 'package:canzo_app/feature/user/history/presentation/view/widget/complete_history_view.dart';
import 'package:canzo_app/feature/user/history/presentation/view/widget/tab_bar_item_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBarHistory extends StatelessWidget {
  const TabBarHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) => serviceLocator<HistoryCubit>()
          ..getBaskets(context, 'Pending')
          ..getBaskets(context, 'Cancelled')
          ..getBaskets(context, 'Completed'),
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              const TabBarItemHistory(),

              const SizedBox(height: 10),

              const Expanded(
                child: TabBarView(
                  children: [
                    BiddingHistoryView(),
                    CanceledHistoryView(),
                    CompleteHistoryView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}