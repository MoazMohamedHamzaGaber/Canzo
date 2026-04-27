import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/custom_app_bar.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/custom_card_home.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/pickup_request.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/quick_stats_section.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: 'Hi, Moaz',
              body: 'Lets\'s recycle something today',
            ),
            sizeBox(),
            CustomCardHome(),
            sizeBox(),
            PickupRequestView(),
            sizeBox(),
            QuickStatsSection(),
          ],
        ),
      ),
    );
  }
}
