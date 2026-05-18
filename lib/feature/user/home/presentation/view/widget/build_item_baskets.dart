import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BuildItemBaskets extends StatelessWidget {
  const BuildItemBaskets({super.key, required this.title, required this.value});
  final String title;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 12,
          bottom: 20,
          right: 12,
          left: 12
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black45),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/basket.png', width: 50, height: 50,),
          Expanded(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                      style: StyleText.style19,
                    ),
                    Text(AppStrings.empty.tr(),
                      style: StyleText.style13,
                    ),
                  ],
                ),
                Spacer(),
                Switch(
                    value: value,
                    activeThumbColor: Colors.green,
                    onChanged: (value) async {}
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
