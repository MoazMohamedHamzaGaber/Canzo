import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/authentication/domain/entity/activity_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar appBar({
  context,
  required String text,
  required String body,
}) =>
    AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: StyleText.style20(
              color: AppColors.green,
            ),
          ),
          Text(
            body,
            textAlign: TextAlign.center,
            style: StyleText.style16,
          ),
        ],
      ),
    );

Widget buildTextField({
  required context,
  required TextEditingController controller,
  required String title,
  required TextInputType keyboardType,
  String? validate,
  int? maxLength,
  int? minLines,
  int? maxLines,
  List<TextInputFormatter>? inputFormatters,
  Widget? prefix,
  IconData? prefixIcon,
  bool obscureText = false,
}) =>
    TextFormField(
      maxLength: maxLength,
      minLines: minLines,
      maxLines: obscureText ? 1 : maxLines ?? 1,
      obscureText: obscureText ,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: (value) {
        if (value!.isEmpty) {
          return validate;
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

Widget buildMaterialButton({
  required String text,
  required Function function,
  double height = 50,
  double fontSize = 19,
  required Color color,
}) =>
    Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

String getActivityLabel(ActivityType type) {
  switch (type) {
    case ActivityType.restaurant:
      return AppStrings.nameRestaurant.tr();

    case ActivityType.cafe:
      return AppStrings.nameCafe.tr();

    case ActivityType.weddingHall:
      return AppStrings.nameWeddingHall.tr();

    case ActivityType.club:
      return AppStrings.nameClub.tr();
  }
}