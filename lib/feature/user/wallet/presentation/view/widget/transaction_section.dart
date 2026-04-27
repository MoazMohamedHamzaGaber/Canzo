import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/user/wallet/presentation/view/widget/build_list_view_transaction.dart';
import 'package:flutter/material.dart';

class TransactionSection extends StatelessWidget {
  const TransactionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TRANSACTIONS',
          style: StyleText.style18.copyWith(
            color: Colors.green.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
        sizeBox(),
        BuildListViewTransaction(),
      ],
    );
  }
}
