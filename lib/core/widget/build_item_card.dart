import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BuildItemCard extends StatelessWidget {
  const BuildItemCard({
    super.key,
    this.body = true,
    this.image = true,
    this.title,
    required this.subtitle,
    required this.price,
    required this.state,
    required this.createAt,
  });

  final bool? body;
  final bool? image;
  final String? title;
  final String subtitle;
  final String state;
  final String createAt;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black45),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (image == true)
                Image.asset('assets/images/logo.jpg', width: 50, height: 50),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title !=null) Text(title!, style: StyleText.style19),
                  sizeBox(height: 5),
                  Text('${AppStrings.address.tr()}: $subtitle', style: StyleText.style19.copyWith(
                    fontSize: 15
                  )),
                  sizeBox(height: 5),
                  if (body == true) Text(createAt, style: StyleText.style13),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black45),
                    ),
                    child: Text(
                      state,
                      style: StyleText.style13.copyWith(
                        color: AppColors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${AppStrings.egp.tr()} $price',
                    style: StyleText.style19,
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
