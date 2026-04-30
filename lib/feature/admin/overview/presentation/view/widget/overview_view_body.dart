import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/custom_app_bar.dart';
import 'package:canzo_app/feature/admin/overview/presentation/view/widget/custom_card_overview_admin.dart';
import 'package:canzo_app/feature/admin/overview/presentation/view/widget/pending_approvals.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OverviewViewBody extends StatelessWidget {
  const OverviewViewBody({super.key});

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
                title: AppStrings.admin.tr(),
                body: 'System overview & approvals',
              ),
              sizeBox(),
              CustomCardOverviewAdmin(),
              sizeBox(height: 30),
              PendingApprovals(),
              sizeBox(),
            ],
          ),
        ),
      ),
    );
  }
}
