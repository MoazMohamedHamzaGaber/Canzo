import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/custom_app_bar.dart';
import 'package:canzo_app/feature/delivery/home/presentation/view/widget/active_pickups_delivery.dart';
import 'package:canzo_app/feature/delivery/home/presentation/view/widget/completed_pickups_delivery.dart';
import 'package:canzo_app/feature/delivery/home/presentation/view/widget/custom_card_home_delivery.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeDeliveryViewBody extends StatelessWidget {
  const HomeDeliveryViewBody({super.key});

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
                body: AppStrings.todayPickups.tr(),
              ),
              sizeBox(),
              CustomCardHomeDelivery(),
              sizeBox(),
              ActivePickupsDelivery(),
              sizeBox(),
              CompletedPickupsDelivery(),
            ],
          ),
        ),
      ),
    );
  }
}
