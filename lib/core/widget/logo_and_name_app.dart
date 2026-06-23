import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LogoAndNameApp extends StatelessWidget {
  const LogoAndNameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .1,
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/logo.jpg',
                      ),
                    ),
                  ),
                ),
                sizeBox(width: 10),
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    sizeBox(height: 8),
                    Text(
                      AppStrings.canzo.tr(),
                      style: StyleText.style19,
                    ),
                    Text(
                      AppStrings.recycle.tr(),
                      style: StyleText.style16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
