import 'package:flutter/material.dart';
import 'package:canzo_app/feature/authentication/domain/entity/app_role.dart';
import 'package:canzo_app/core/utils/color.dart';

import 'package:canzo_app/feature/user/home/presentation/view/home_view.dart';
import 'package:canzo_app/feature/user/history/presentation/view/history_view.dart';
import 'package:canzo_app/feature/user/wallet/presentation/view/wallet_view.dart';
import 'package:canzo_app/feature/profile/presentation/view/profile_view.dart';

class RoleConfig {

  static List<Widget> screens(AppRole role) {
    switch (role) {
      case AppRole.user:
        return const [
          HomeView(),
          HistoryView(),
          WalletView(),
          ProfileView(),
        ];

      case AppRole.admin:
        return const [
          Center(child: Text("Overview")),
          Center(child: Text("Analytics")),
          ProfileView(),
        ];

      case AppRole.delivery:
        return const [
          Center(child: Text("Pickups")),
          Center(child: Text("History")),
          ProfileView(),
        ];
    }
  }


  static List<BottomNavigationBarItem> items(AppRole role) {
    switch (role) {
      case AppRole.user:
        return [
          _item(Icons.home, "Home"),
          _item(Icons.history, "History"),
          _item(Icons.wallet, "Wallet"),
          _item(Icons.person, "Profile"),
        ];

      case AppRole.admin:
        return [
          _item(Icons.dashboard, "Overview"),
          _item(Icons.analytics, "Analytics"),
          _item(Icons.person, "Profile"),
        ];

      case AppRole.delivery:
        return [
          _item(Icons.local_shipping, "Pickups"),
          _item(Icons.history, "History"),
          _item(Icons.person, "Profile"),
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