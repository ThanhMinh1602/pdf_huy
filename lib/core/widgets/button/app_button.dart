import 'package:account/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final String title;
  final String iconPath;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? boderColor;
  final void Function()? onPressed;

  const AppButton({
    super.key,
    required this.title,
    required this.iconPath,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
    this.boderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColor.c_006EA9,
          foregroundColor: foregroundColor ?? AppColor.c_FFFFFF,
          padding: const EdgeInsets.symmetric(horizontal: 7.15, vertical: 6.57),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: boderColor ?? AppColor.c_006EA9,
              width: 1.43,
            ),
            borderRadius: BorderRadius.circular(5.71),
          )),
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          const SizedBox(width: 3.0),
          Text(
            title,
            style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
