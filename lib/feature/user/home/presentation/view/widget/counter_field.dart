import 'package:flutter/material.dart';

import '../../../../../../core/utils/color.dart';

class CounterField extends StatelessWidget {
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterField({
    super.key,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onIncrement,
            child: Icon(Icons.add,size: 22)),
        SizedBox(width: 8,),
        Text(
          value.toString(),
          style:  TextStyle(fontSize: 22,color: AppColors.green),
        ),
        SizedBox(width: 8,),
        GestureDetector(
          onTap: onDecrement,
            child: Icon(Icons.remove,size: 22)),
      ],
    );
  }
}