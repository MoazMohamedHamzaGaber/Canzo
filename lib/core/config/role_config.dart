import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/feature/admin/analytics/presentation/view/analytics_view.dart';
import 'package:canzo_app/feature/admin/overview/presentation/view/overview_view.dart';
import 'package:canzo_app/feature/delivery/history/view/history_delivery_view.dart';
import 'package:canzo_app/feature/delivery/home/presentation/view/home_delivery_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:canzo_app/core/utils/color.dart';

import 'package:canzo_app/feature/user/home/presentation/view/home_view.dart';
import 'package:canzo_app/feature/user/history/presentation/view/history_view.dart';
import 'package:canzo_app/feature/user/wallet/presentation/view/wallet_view.dart';
import 'package:canzo_app/feature/profile/presentation/view/profile_view.dart';

class RoleConfig {

  static List<Widget> screens(String role) {
    switch (role) {
      case 'admin':
        return const [
          OverviewView(),
          AnalyticsView(),
          ProfileView(),
        ];

      case 'delivery':
        return const [
          HomeDeliveryView(),
          HistoryDeliveryView(),
          ProfileView(),
        ];

      default:
        return const [
          HomeView(),
          HistoryView(),
          WalletView(),
          ProfileView(),
        ];
    }
  }


  static List<BottomNavigationBarItem> items(String role) {
    switch (role) {
      case 'admin':
        return [
          _item(Icons.dashboard, AppStrings.overview.tr()),
          _item(Icons.analytics, AppStrings.analytics.tr()),
          _item(Icons.person, AppStrings.profile.tr()),
        ];
      case 'delivery':
        return [
          _item(Icons.local_shipping_outlined, AppStrings.pickups.tr()),
          _item(Icons.history, AppStrings.history.tr()),
          _item(Icons.person, AppStrings.profile.tr()),
        ];

      default:
        return [
          _item(Icons.home, AppStrings.home.tr()),
          _item(Icons.history, AppStrings.history.tr()),
          _item(Icons.wallet, AppStrings.wallet.tr()),
          _item(Icons.person, AppStrings.profile.tr()),
        ];
    }
  }


  static BottomNavigationBarItem _item(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green.shade50,
          border: Border.all(),
        ),
        child: Icon(icon, color: AppColors.green),
      ),
      label: label,
    );
  }
}