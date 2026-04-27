import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/custom_app_bar.dart';
import 'package:canzo_app/feature/profile/presentation/view/widget/build_card_profile_info.dart';
import 'package:canzo_app/feature/profile/presentation/view/widget/prefernces_section.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: 'Settings',
                body: 'Account & Preferences',
              ),
              sizeBox(),
              BuildCardProfileInfo(),
              sizeBox(),
              PreferencesSection(),
            ],
          ),
        ),
      ),
    );
  }
}
