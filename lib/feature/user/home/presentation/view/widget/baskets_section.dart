import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_state.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/build_item_baskets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BasketsSection extends StatelessWidget {
  const BasketsSection({super.key, required this.state});

 final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.baskets.tr(),
          style: StyleText.style18.copyWith(
            color: Colors.green.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
        sizeBox(height: 10),
        SizedBox(
          height: 300,
          child: ListView.separated(
            // shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => BuildItemBaskets(
              title:
                  'Kg basket ${state.baskets![index].contentWeight} - ${state.baskets![index].contentType}',
              value: state.baskets![index].isFull == 0 ? false: true,
            ),
            separatorBuilder: (context, index) => sizeBox(),
            itemCount: state.baskets?.length ??0,
          ),
        ),
      ],
    );
  }
}
