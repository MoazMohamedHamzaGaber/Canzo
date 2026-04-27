import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/custom_app_bar.dart';
import 'package:canzo_app/feature/user/history/presentation/view/widget/tab_bar_history.dart';
import 'package:flutter/material.dart';

class HistoryViewBody extends StatelessWidget {
  const HistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
                title: 'History',
                body: 'All your pickup requests',
            ),
            sizeBox(),
            TabBarHistory(),
          ],
        ),
      ),
    );
  }
}
