import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/custom_text_field.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/dropdown_button_pickup.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CreatePickup extends StatefulWidget {
  const CreatePickup({super.key});

  @override
  State<CreatePickup> createState() => _CreatePickupState();
}

class _CreatePickupState extends State<CreatePickup> {
  var locationController = TextEditingController();
  var packagesController = TextEditingController();
  var notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.createPickup.tr(), style: StyleText.style19),
                        Text(
                          AppStrings.registerPickup.tr(),
                          style: StyleText.style16,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(),
                      ),
                      child: Text(AppStrings.back.tr(), style: StyleText.style19),
                    ),
                  ),
                ],
              ),
              CustomTextField(
                controller: locationController,
                title: AppStrings.location.tr(),
                name: '',
                validate: '',
                type: TextInputType.text,
              ),
              sizeBox(height: 30),
              DropdownButtonPickup(),
              sizeBox(),
              CustomTextField(
                controller: packagesController,
                title: AppStrings.packages.tr(),
                name: '',
                validate: '',
                type: TextInputType.number,
              ),
              sizeBox(),
              CustomTextField(
                controller: packagesController,
                title: AppStrings.note.tr(),
                name: '',
                validate: '',
                type: TextInputType.text,
              ),
              sizeBox(),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '${AppStrings.estimatePayout.tr()} 100',
                  textAlign: TextAlign.center,
                  style: StyleText.style18.copyWith(
                    color: Colors.green.shade500,
                  ),
                ),
              ),
              sizeBox(),
              buildMaterialButton(
                text: AppStrings.submitPickup.tr(),
                function: () {},
                color: AppColors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
