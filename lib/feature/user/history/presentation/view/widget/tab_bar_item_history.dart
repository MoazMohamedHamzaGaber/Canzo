import 'package:canzo_app/core/utils/color.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/style.dart';

class TabBarItemHistory extends StatefulWidget {
  const TabBarItemHistory({super.key});

  @override
  State<TabBarItemHistory> createState() => _TabBarItemHistoryState();
}

class _TabBarItemHistoryState extends State<TabBarItemHistory> {
  @override
  Widget build(BuildContext context) {
    final controller = DefaultTabController.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return TabBar(
          isScrollable: true,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          tabAlignment: TabAlignment.start,
          labelPadding: const EdgeInsets.symmetric(horizontal: 5),
          tabs: [
            _buildTab("All", 0, controller),
            _buildTab("Bidding", 1, controller),
            _buildTab("In Progress", 2, controller),
            _buildTab("Complete", 3, controller),
          ],
        );
      },
    );
  }

  Widget _buildTab(String text, int index, TabController controller) {
    final isSelected = controller.index == index;

    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? null
              : Border.all(),
        ),
        child: Text(
          text,
          style: StyleText.style13.copyWith(
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}