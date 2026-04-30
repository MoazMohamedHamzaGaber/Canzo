import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BuildItemAllRequests extends StatelessWidget {
  const BuildItemAllRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Icon(Icons.circle,color: AppColors.green,size: 12,),
          sizeBox(width: 10),
          Text('Moaz Mohamed -req-1001',),
          Spacer(),
          Text('${AppStrings.egp.tr()} 300',
          style: TextStyle(
            color: AppColors.green,
            fontWeight: FontWeight.bold
          ),
          ),
        ],
      ),
    );
  }
}
