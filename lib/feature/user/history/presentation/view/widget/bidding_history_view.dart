import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/build_item_card.dart';
import 'package:canzo_app/core/widget/empty_screen.dart';
import 'package:canzo_app/feature/user/history/presentation/cubit/history_cubit.dart';
import 'package:canzo_app/feature/user/history/presentation/cubit/history_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_strings.dart';

class BiddingHistoryView extends StatelessWidget {
  const BiddingHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (BuildContext context, state) {
        if(state.pendingOrders != null && state.pendingOrders!.isNotEmpty) {
          return ListView.separated(
            itemBuilder: (context, index) => BuildItemCard(
              title: '3 packages - plastic',
              subtitle: state.pendingOrders?[index].address ?? '',
              state: state.pendingOrders?[index].status ?? '',
              createAt: state.pendingOrders?[index].createdAt ?? '',
            ),
            separatorBuilder: (context, index) => sizeBox(),
            itemCount: state.pendingOrders?.length ??0,
          );
        }else if(state.pendingOrders != null && state.pendingOrders!.isEmpty){
          return EmptyScreen(title: AppStrings.noBinding.tr());
        }
        else if(state.status == HistoryStates.error){
          return EmptyScreen(title: state.failure!.errMessage);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
