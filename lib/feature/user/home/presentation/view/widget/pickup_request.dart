import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/create_pickup.dart';
import 'package:flutter/material.dart';

class PickupRequestView extends StatelessWidget {
  const PickupRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateTo(context, CreatePickup());
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black45),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.green,
               borderRadius: BorderRadius.circular(12),
               // shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
            ),
            sizeBox(),
            Expanded(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New pickup request',
                        style: StyleText.style19.copyWith(
                          color: AppColors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text('100 EGP per filled package', style: StyleText.style13),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_right_alt_rounded),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
