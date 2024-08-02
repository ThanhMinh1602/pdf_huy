
import 'package:account/core/constants/app_color.dart';
import 'package:account/core/constants/app_style.dart';
import 'package:account/core/utils/color_resources.dart';
import 'package:account/core/utils/icons.dart';
import 'package:account/core/widgets/button/common_button.dart';
import 'package:flutter/material.dart';

class E01S01003RightSection extends StatelessWidget {
  final String title;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final void Function()? sectionOnPressedSave;
  const E01S01003RightSection({
    super.key,
    required this.title,
    required this.child,
    this.sectionOnPressedSave,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
          width: double.infinity,
          height: 50.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(5.0)),
            color: AppColor.c_B8E5FA,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppStyle.sectionRightHeader),
              CommonButton(
                width: 70,
                onTap: sectionOnPressedSave,
                buttonIcon: IconsApp.save,
                backgroundColor: ColorResources.buttonSave,
                textName: "Lưu",
              ),
            ],
          ),
        ),
        Container(
          padding: padding,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColor.c_FFFFFF,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(5.0)),
          ),
          child: child,
        )
      ],
    );
  }
}
