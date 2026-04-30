import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/admin/overview/presentation/view/widget/build_item_all_requests.dart';
import 'package:flutter/material.dart';

class AllRequestsOverviewSection extends StatelessWidget {
  const AllRequestsOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ALL REQUESTS',
          style: StyleText.style18.copyWith(
            color: Colors.green.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
        sizeBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index)=>BuildItemAllRequests(),
          separatorBuilder: (context,index)=>SizedBox(),
          itemCount: 4,
        ),
      ],
    );
  }
}
