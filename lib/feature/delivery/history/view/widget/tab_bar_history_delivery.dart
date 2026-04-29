import 'package:canzo_app/feature/delivery/history/view/widget/all_history_delivery_view.dart';
import 'package:canzo_app/feature/delivery/history/view/widget/complete_history_delivery_view.dart';
import 'package:canzo_app/feature/delivery/history/view/widget/inprogress_history_delivery_view.dart';
import 'package:canzo_app/feature/delivery/history/view/widget/tab_bar_item_history_delivery.dart';
import 'package:flutter/material.dart';


class TabBarHistoryDelivery extends StatelessWidget {
  const TabBarHistoryDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBarItemHistoryDelivery(),
            const SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                children: [
                  AllHistoryDeliveryView(),
                  InProgressHistoryDeliveryView(),
                  CompleteHistoryDeliveryView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
