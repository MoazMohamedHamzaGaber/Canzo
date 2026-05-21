import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/build_item_card.dart';
import 'package:canzo_app/core/widget/empty_screen.dart';
import 'package:canzo_app/feature/user/history/presentation/cubit/history_cubit.dart';
import 'package:canzo_app/feature/user/history/presentation/cubit/history_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CanceledHistoryView extends StatelessWidget {
  const CanceledHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (BuildContext context, state) {
        if (state.status == HistoryStates.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.status == HistoryStates.error) {
          return EmptyScreen(title: state.failure!.errMessage);
        }
        if(state.cancelledOrders != null && state.cancelledOrders!.isNotEmpty) {
          return ListView.separated(
          itemBuilder: (context, index) => BuildItemCard(
            title: '3 packages - plastic',
            subtitle: state.cancelledOrders?[index].address ?? '',
            state: state.cancelledOrders?[index].status ?? '',
            createAt: state.cancelledOrders?[index].createdAt ?? '',
          ),
          separatorBuilder: (context, index) => sizeBox(),
          itemCount: state.cancelledOrders?.length ?? 0,
        );
        }else{
          return EmptyScreen(title: 'No canceled orders yet');
        }
      },
    );
  }
}
