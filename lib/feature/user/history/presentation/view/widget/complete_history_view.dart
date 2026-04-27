import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/build_item_card.dart';
import 'package:flutter/material.dart';

class CompleteHistoryView extends StatelessWidget {
  const CompleteHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context,index)=>BuildItemCard(),
      separatorBuilder: (context,index)=>sizeBox(),
      itemCount: 20,
    );
  }
}
