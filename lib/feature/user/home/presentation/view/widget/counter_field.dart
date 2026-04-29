import 'package:flutter/material.dart';

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
    return Container(
      width: 80,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green.shade100),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                value.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: onIncrement,
                child: const Icon(Icons.keyboard_arrow_up, size: 13),
              ),
              GestureDetector(
                onTap: onDecrement,
                child: const Icon(Icons.keyboard_arrow_down, size: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}