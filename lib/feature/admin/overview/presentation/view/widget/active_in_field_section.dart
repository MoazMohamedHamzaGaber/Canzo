// import 'package:canzo_app/core/utils/app_strings.dart';
// import 'package:canzo_app/core/utils/const.dart';
// import 'package:canzo_app/core/utils/style.dart';
// import 'package:canzo_app/feature/admin/overview/presentation/view/widget/build_item_active_in_field.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// class ActiveInFieldSection extends StatelessWidget {
//   const ActiveInFieldSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           AppStrings.activeInField.tr(),
//           style: StyleText.style18.copyWith(
//             color: Colors.green.shade500,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         sizeBox(height: 10),
//         ListView.separated(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemBuilder: (context,index)=>BuildItemActiveInField(),
//           separatorBuilder: (context,index)=>sizeBox(),
//           itemCount: 2,
//         ),
//       ],
//     );
//   }
// }
