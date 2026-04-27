import 'package:canzo_app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomAppBar(
              title: 'Hi, Moaz',
              body: 'Lets\'s recycle something today',
            ),
          ],
        ),
      ),
    );
  }
}
