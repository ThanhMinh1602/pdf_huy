import 'package:account/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSquareButton extends StatelessWidget {
  final void Function()? onTap;
  final String iconPath;
  const AppSquareButton({
    super.key,
    this.onTap,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.0,
        height: 40.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColor.c_006EA9,
            borderRadius: BorderRadius.circular(5.71)),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}
