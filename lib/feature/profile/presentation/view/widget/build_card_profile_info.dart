import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class BuildCardProfileInfo extends StatelessWidget {
  const BuildCardProfileInfo({super.key, });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.jpg', width: 80, height: 80,),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Moaz Mohamed',
                    style: StyleText.style19,
                  ),
                  Text('moaz@gmail.co m',
                    style: StyleText.style13,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 16
                    ),
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black45),
                    ),
                    child: Text('USER',
                      style: StyleText.style13.copyWith(
                          color: AppColors.green,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
