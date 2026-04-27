import 'package:canzo_app/feature/user/history/presentation/view/widget/all_history_view.dart';
import 'package:canzo_app/feature/user/history/presentation/view/widget/bidding_history_view.dart';
import 'package:canzo_app/feature/user/history/presentation/view/widget/complete_history_view.dart';
import 'package:canzo_app/feature/user/history/presentation/view/widget/inprogress_history_view.dart';
import 'package:canzo_app/feature/user/history/presentation/view/widget/tab_bar_item_history.dart';
import 'package:flutter/material.dart';


class TabBarHistory extends StatelessWidget {
  const TabBarHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            const TabBarItemHistory(),

            const SizedBox(height: 10),

            Expanded(
              child: TabBarView(
                children: [
                  AllHistoryView(),
                  BiddingHistoryView(),
                  InProgressHistoryView(),
                  CompleteHistoryView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
