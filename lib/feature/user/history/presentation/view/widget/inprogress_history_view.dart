import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/user/history/presentation/view/widget/build_item_history.dart';
import 'package:flutter/material.dart';

class InProgressHistoryView extends StatelessWidget {
  const InProgressHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context,index)=>BuildItemHistory(),
      separatorBuilder: (context,index)=>sizeBox(),
      itemCount: 20,
    );
  }
}
