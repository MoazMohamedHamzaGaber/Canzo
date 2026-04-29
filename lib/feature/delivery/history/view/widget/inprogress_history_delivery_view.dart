import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/build_item_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InProgressHistoryDeliveryView extends StatelessWidget {
  const InProgressHistoryDeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => BuildItemCard(
        title: 'Moaz Mohamed',
        subtitle: '3pk - plastic',
        state: AppStrings.inProgress.tr(),
        image: false,
      ),
      separatorBuilder: (context,index)=>sizeBox(),
      itemCount: 20,
    );
  }
}
