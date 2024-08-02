import 'package:account/core/constants/app_color.dart';
import 'package:account/core/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RemoveButton extends StatelessWidget {
  final void Function()? onTap;
  const RemoveButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 55.71,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.71),
          border: Border.all(
            color: AppColor.c_D84226,
            width: 1.43,
          ),
        ),
        child: Image.asset(IconsApp.delete),
      ),
    );
  }
}
