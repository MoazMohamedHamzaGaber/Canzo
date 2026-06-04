import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/build_item_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AllHistoryDeliveryView extends StatelessWidget {
  const AllHistoryDeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => BuildItemCard(
        title: 'Moaz Mohamed',
        price: 100,
        subtitle: '3pk - plastic',
        state: AppStrings.inProgress.tr(),
        image: false, createAt: '27 Api 2026 - 07:09',
      ),
      separatorBuilder: (context,index)=>sizeBox(),
      itemCount: 20,
    );
  }
}
