import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/custom_app_bar.dart';
import 'package:canzo_app/core/widget/empty_screen.dart';
import 'package:canzo_app/feature/admin/overview/presentation/cubit/overview_state.dart';
import 'package:canzo_app/feature/admin/overview/presentation/view/widget/custom_card_overview_admin.dart';
import 'package:canzo_app/feature/admin/overview/presentation/view/widget/pending_approvals.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/service/service_locator.dart';
import '../../cubit/overview_cubit.dart';

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
                title: AppStrings.adminApp.tr(),
                body: AppStrings.systemOverview.tr(),
              ),
              sizeBox(),
              BlocProvider(
                create: (BuildContext context) =>
                serviceLocator<OverviewCubit>()
                  ..loadData(),
                child: BlocConsumer<OverviewCubit,OverviewState>(
                  listener: (BuildContext context, state) {  },
                  builder: (context, state) {
                    if (state.status == OverviewStates.loading) {
                      return SizedBox(
                        height: MediaQuery.sizeOf(context).height * .7,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (state.status == OverviewStates.error) {
                      return EmptyScreen(
                        title: state.failure?.errMessage ?? '',
                      );
                    }

                    if (state.wallet == null) {
                      return const SizedBox();
                    }

                    final pendingOrders = state.orders
                        .where((e) => e.status == 'Pending')
                        .toList();

                    return Column(
                      children: [
                        CustomCardOverviewAdmin(
                          wallet: state.wallet!,
                        ),

                        sizeBox(height: 30),

                        state.orders.isEmpty
                            ? const EmptyScreen(title: 'No order')
                            : PendingApprovals(
                          pendingOrders: pendingOrders,
                        ),
                      ],
                    );
                  },
                ),
              ),
              // sizeBox(),
              // ActiveInFieldSection(),
              // sizeBox(),
              // AllRequestsOverviewSection(),
            ],
          ),
        ),
      ),
    );
  }
}
