import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/delivery/home/presentation/view/widget/build_item_completed_pickups_delivery.dart';
import 'package:flutter/material.dart';

class CompletedPickupsDelivery extends StatelessWidget {
  const CompletedPickupsDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'COMPLETED PICKUPS',
          style: StyleText.style18.copyWith(
            color: Colors.green.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
        sizeBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index)=>BuildItemCompletedPickupsDelivery(),
          separatorBuilder: (context,index)=>sizeBox(),
          itemCount: 2,
        ),
      ],
    );
  }
}
