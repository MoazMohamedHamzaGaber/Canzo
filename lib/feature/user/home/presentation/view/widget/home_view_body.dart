import 'package:canzo_app/core/service/service_locator.dart';
import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/custom_app_bar.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_cubit.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_state.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/active_requests.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/baskets_section.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/custom_card_home.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/pickup_request.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/quick_stats_section.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/resent_packup_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>serviceLocator<HomeCubit>()..getBaskets(context),
      child: BlocBuilder<HomeCubit,HomeState>(
        builder: (BuildContext context, state) {
          if(state.status ==HomeStates.loading){
            return Center(child: CircularProgressIndicator());
          }
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
                    BasketsSection(state: state,),
                    sizeBox(),
                    ActiveRequests(),
                    sizeBox(),
                    ResentPickupSection(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
