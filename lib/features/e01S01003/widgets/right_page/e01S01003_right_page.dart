import 'package:account/core/constants/app_color.dart';
import 'package:account/core/utils/color_resources.dart';
import 'package:account/core/utils/dimensions.dart';
import 'package:account/core/utils/icons.dart';
import 'package:account/core/widgets/button/common_button.dart';
import 'package:account/features/e01S01003/widgets/right_page/e01S01003_decentralization_section.dart';
import 'package:account/features/e01S01003/widgets/right_page/e01S01003_role_group_information_section.dart';
import 'package:account/features/e01S01003/widgets/right_page/e01S01003_user_section.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class E01S01003RightPage extends StatelessWidget {
  const E01S01003RightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 5,
      child: Container(
          height: MediaQuery.of(context).size.height,
          padding:
              const EdgeInsets.symmetric(horizontal: 10.0).copyWith(top: 14.5),
          decoration: const BoxDecoration(
              color: AppColor.c_F8FAFC,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildRightHeader(
                  addOnPressed: () {},
                  editOnPressed: () {},
                  saveOnPressed: () {},
                  cancelOnPressed: () {},
                  nextOnPressed: () {},
                ),
                const E01S01003RoleGroupInformationSection(),
                const SizedBox(height: 5.0),
                const E01S01003UserSection(),
                const SizedBox(height: 5.0),
                const DecentralizationSection(),
              ],
            ),
          )),
    );
  }

  Widget _buildRightHeader({
    required void Function() addOnPressed,
    required void Function() editOnPressed,
    required void Function() saveOnPressed,
    required void Function() cancelOnPressed,
    required void Function() nextOnPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.5),
      child: Row(
        children: [
          Expanded(flex: 9, child: Container()),
          SizedBox(
            width: 78,
            child: CommonButton(
              backgroundColor: ColorResources.buttonSave,
              buttonIcon: IconsApp.add,
              textName: "Thêm",
              onTap: addOnPressed,
            ),
          ),
          const SizedBox(width: Dimensions.paddingSizeExtraSmall),
          SizedBox(
            width: 68,
            child: CommonButton(
              backgroundColor: ColorResources.buttonSave,
              buttonIcon: IconsApp.edit,
              textName: "Sửa",
              onTap: editOnPressed,
            ),
          ),
          const SizedBox(width: Dimensions.paddingSizeExtraSmall),
          SizedBox(
            width: 68,
            child: CommonButton(
              backgroundColor: ColorResources.buttonSave,
              buttonIcon: IconsApp.save,
              textName: "Lưu",
              onTap: saveOnPressed,
            ),
          ),
          const SizedBox(width: Dimensions.paddingSizeExtraSmall),
          SizedBox(
            width: 68,
            child: CommonButton(
              borderColor: ColorResources.blue,
              backgroundColor: ColorResources.white,
              isBorder: true,
              buttonIcon: IconsApp.close,
              textName: "Huỷ",
              textColor: ColorResources.blue,
              onTap: cancelOnPressed,
            ),
          ),
          const SizedBox(width: Dimensions.paddingSizeExtraSmall),
          InkWell(
            onTap: nextOnPressed,
            child: Image.asset(IconsApp.buttonDistance),
          ),
        ],
      ),
    );
  }
}
