import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/build_item_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CompleteHistoryView extends StatelessWidget {
  const CompleteHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => BuildItemCard(
        title: '3 packages - plastic',
        subtitle: 'Haram, Giza',
        state: AppStrings.complete.tr(),
      ),
      separatorBuilder: (context,index)=>sizeBox(),
      itemCount: 20,
    );
  }
}
