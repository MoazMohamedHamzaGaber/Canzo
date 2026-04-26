import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar appBar({
  context,
  String? text,
  IconData? iconData,
  bool centerTitle = false,
  required Function function,
}) =>
    AppBar(
      centerTitle: centerTitle,
      // leading: IconButton(
      //   onPressed: () {
      //     function();
      //   },
      //   icon: Icon(
      //     IconlyLight.arrowLeft2,
      //     color:
      //         DashboardCubit.get(context).isDark ? Colors.white : Colors.black,
      //   ),
      // ),
      title: Text(
        text!,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconData,
            color: Colors.red,
          ),
        ),
      ],
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
