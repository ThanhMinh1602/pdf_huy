import 'package:account/core/const/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final double width;
  final double? height;
  final Widget? suffix;
  final TextEditingController? controller;
  final int? maxLines;

  CustomTextField({
    required this.hintText,
    required this.width,
    this.suffix,
    this.controller,
    this.maxLines,
    this.height,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 35,
      width: widget.width,
      child: TextFormField(
        cursorColor: AppColors.textBlack,
        textAlignVertical: TextAlignVertical.center,
        controller: widget.controller ?? TextEditingController(),
        maxLines: widget.maxLines ?? 1,
        // cursorHeight: 15,
        decoration: InputDecoration(
          suffixIcon: widget.suffix ?? SizedBox(),
          // contentPadding: EdgeInsets.only(top: 2, left: 20),

          hintText: widget.hintText,
          hintStyle: TextStyle(fontFamily: 'Nunito', fontSize: 13),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.border),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.border),
          ),
        ),
        style: TextStyle(fontFamily: 'Nunito', fontSize: 13),
      ),
    );
  }
}
