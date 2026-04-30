import 'package:flutter/material.dart';

class MaterialProgressItem extends StatelessWidget {
  final String title;
  final double value;
  final String amount;

  const MaterialProgressItem({
    super.key,
    required this.title,
    required this.value,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(amount, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 8,
              backgroundColor: Colors.grey.shade300,
              valueColor:
              const AlwaysStoppedAnimation(Color(0xff4CAF50)),
            ),
          ),
        ],
      ),
    );
  }
}