import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/custom_app_bar.dart';
import 'package:canzo_app/feature/delivery/history/view/widget/tab_bar_history_delivery.dart';
import 'package:flutter/material.dart';

class HistoryDeliveryViewBody extends StatelessWidget {
  const HistoryDeliveryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: 'Completed pickups',
              body: 'All your pickup requests',
            ),
            sizeBox(),
            TabBarHistoryDelivery(),
          ],
        ),
      ),
    );
  }
}
