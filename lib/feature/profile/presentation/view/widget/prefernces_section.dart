import 'package:canzo_app/core/service/service_locator.dart';
import 'package:canzo_app/core/shared/shared_preference.dart';
import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/authentication/presentation/view/login_view.dart';
import 'package:canzo_app/feature/profile/presentation/view/widget/language_custom.dart';
import 'package:canzo_app/feature/profile/presentation/view/widget/open_whats_app.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/cubit/auth_cubit.dart';

class PreferencesSection extends StatelessWidget {
  const PreferencesSection({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.preferences.tr(),
          style: StyleText.style16.copyWith(
            color: Colors.green.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
        sizeBox(height: 10),
        LanguageCustom(),
        sizeBox(),
        GestureDetector(
          onTap: () {
            openWhatsApp();
          },
          child: buildItemPreference(
            icon: Icons.chat,
            title: AppStrings.support.tr(),
            subtitle: AppStrings.whats.tr(),
            color: AppColors.green,
          ),
        ),
        sizeBox(),
        buildItemPreference(
          icon: Icons.privacy_tip_outlined,
          title: AppStrings.terms.tr(),
          subtitle: AppStrings.view.tr(),
          color: Colors.grey,
          isArrow: false,
        ),
        sizeBox(height: 30),
        GestureDetector(
          onTap: () async {
            await SharedPreference.removeData(key: 'token');
            await SharedPreference.removeData(key: 'role');

            token = null;
            role = null;

            if (context.mounted) {
              context.read<AuthCubit>().resetAuth();

              navigateAndFinish(
                context,
                BlocProvider(
                  create: (_) => serviceLocator<AuthCubit>(),
                  child: const LoginView(),
                ),
              );
            }
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black45),
            ),
            child: Center(
              child: Text(
                AppStrings.signOut.tr(),
                style: StyleText.style26.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildItemPreference({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    bool isArrow = true,
  }) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.grey.shade200),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.green),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (isArrow)
          Icon(Icons.arrow_right_alt, color: AppColors.green, size: 14),
      ],
    ),
  );
}
