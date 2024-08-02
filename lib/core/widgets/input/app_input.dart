import 'package:account/core/constants/app_color.dart';
import 'package:account/core/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppInput extends StatelessWidget {
  final String hintText;
  final String? iconPath;
  final double? maxWidth;
  final double? maxHeight;
  final bool? enabled;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;

  const AppInput({
    super.key,
    required this.hintText,
    this.iconPath,
    this.maxWidth = 300,
    this.maxHeight = 45.0,
    this.onFieldSubmitted,
    this.enabled,
    this.backgroundColor,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      onFieldSubmitted: onFieldSubmitted,
      cursorColor: AppColor.c_2F80ED,
      cursorHeight: 18,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyle.inputText,
        suffixIcon: iconPath != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SvgPicture.asset(
                  iconPath!,
                  width: 24.0,
                  height: 24.0,
                ),
              )
            : null,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.5, horizontal: 16.0),
        filled: true,
        fillColor: backgroundColor ?? AppColor.c_F5F7FA,
        constraints: BoxConstraints(maxWidth: maxWidth!, maxHeight: maxHeight!),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.c_E3E7EB,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.c_E3E7EB,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.c_2F80ED,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }
}
