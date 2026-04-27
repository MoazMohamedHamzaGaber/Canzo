import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/core/widget/build_item_card.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/build_item_baskets.dart';
import 'package:flutter/material.dart';

class ResentPickupSection extends StatelessWidget {
  const ResentPickupSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'RESENT PICKUP',
          style: StyleText.style18.copyWith(
            color: Colors.green.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
        sizeBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index)=>BuildItemCard(body: false,),
          separatorBuilder: (context,index)=>sizeBox(),
          itemCount: 2,
        ),
      ],
    );
  }
}
