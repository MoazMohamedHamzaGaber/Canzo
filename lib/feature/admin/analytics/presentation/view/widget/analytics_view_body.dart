import 'package:canzo_app/core/service/service_locator.dart';
import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/custom_app_bar.dart';
import 'package:canzo_app/feature/admin/analytics/presentation/view/widget/marerials_section.dart';
import 'package:canzo_app/feature/admin/analytics/presentation/view/widget/revenue_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/analytics_cubit.dart';
import '../../cubit/analytics_state.dart';

class AnalyticsViewBody extends StatelessWidget {
  const AnalyticsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: AppStrings.analytics.tr(),
              body: AppStrings.systemInsights.tr(),
            ),

            sizeBox(),
            BlocProvider(
              create: (BuildContext context) =>serviceLocator<AnalyticsCubit>()..getBaskets(),
              child: BlocBuilder<AnalyticsCubit, AnalyticsState>(
                builder: (context, state) {
                  if (state.status == AnalyticsStates.loading) {
                    return Expanded(
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (state.status == AnalyticsStates.error) {
                    return Center(
                      child: Text(state.failure!.errMessage),
                    );
                  }

                  if (state.status == AnalyticsStates.success) {
                    return Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        RevenueCard(
                          analytics: state.analytics!,
                        ),

                        sizeBox(height: 40),

                        MaterialsCard(
                          analytics: state.analytics!,
                        ),
                      ],
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}