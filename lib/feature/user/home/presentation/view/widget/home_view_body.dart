import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/custom_app_bar.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/active_requests.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/baskets_section.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/custom_card_home.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/pickup_request.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/quick_stats_section.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/resent_packup_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              CustomCardHome(),
              sizeBox(),
              PickupRequestView(),
              sizeBox(),
              QuickStatsSection(),
              sizeBox(),
              BasketsSection(),
              sizeBox(),
              ActiveRequests(),
              sizeBox(),
              ResentPickupSection(),
            ],
          ),
        ),
      ),
    );
  }
}
