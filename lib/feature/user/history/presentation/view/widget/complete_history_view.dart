import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/build_item_card.dart';
import 'package:canzo_app/core/widget/empty_screen.dart';
import 'package:canzo_app/feature/user/history/presentation/cubit/history_cubit.dart';
import 'package:canzo_app/feature/user/history/presentation/cubit/history_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_strings.dart';

class CompleteHistoryView extends StatelessWidget {
  const CompleteHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (BuildContext context, state) {
        if (state.status == HistoryStates.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.status == HistoryStates.error) {
          return EmptyScreen(title: state.failure!.errMessage);
        }
        if (state.completedOrders != null &&
            state.completedOrders!.isNotEmpty) {
          return ListView.separated(
            itemBuilder: (context, index) => BuildItemCard(
              title:
                  '${state.completedOrders?[index].contentWeight} packages - ${state.completedOrders?[index].contentType}',
              subtitle: state.completedOrders?[index].address ?? '',
              state: state.completedOrders?[index].status ?? '',
              createAt: state.completedOrders?[index].createdAt ?? '',
              price: state.completedOrders?[index].price ??0,
            ),
            separatorBuilder: (context, index) => sizeBox(),
            itemCount: state.completedOrders?.length ?? 0,
          );
        } else {
          return EmptyScreen(title: AppStrings.noComplete.tr());
        }
      },
    );
  }
}
