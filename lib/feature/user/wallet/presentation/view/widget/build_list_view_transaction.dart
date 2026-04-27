import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/user/wallet/presentation/view/widget/build_Item_transaction.dart';
import 'package:flutter/material.dart';

class BuildListViewTransaction extends StatelessWidget {
  const BuildListViewTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => BuildItemTransaction(),
      separatorBuilder: (context, index) => sizeBox(),
      itemCount: 20,
    );
  }
}