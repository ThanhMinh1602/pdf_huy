import 'package:account/core/const/colors.dart';
import 'package:account/core/utils/spaces.dart';
import 'package:flutter/material.dart';

import 'required_label.dart';

class CustomTextFieldInput extends StatefulWidget {
  final String? title;
  final String? hintText;
  final Color? fillColor;
  final double? height;
  final bool isEnabled;
  final void Function(String?)? onChanged;
  final String? initialValue;
  final bool isRequired;
  final TextAlign? textAlign;
  final Widget? prevIconWidget;
  final bool textAlignEndTitle;
  final double? widthTitle;
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final int? maxLines;

  CustomTextFieldInput({
    super.key,
    this.title,
    this.hintText = '',
    this.isEnabled = true,
    this.fillColor,
    this.height,
    this.onChanged,
    this.initialValue,
    this.isRequired = false,
    this.textAlign,
    this.prevIconWidget,
    this.textAlignEndTitle = false,
    this.widthTitle,
    this.suffixWidget,
    this.controller,
    this.maxLines,
  });

  @override
  State<CustomTextFieldInput> createState() => _CustomTextFieldInputState();
}

class _CustomTextFieldInputState extends State<CustomTextFieldInput> {
  @override
  Widget build(BuildContext context) {
    double effectiveHeight = widget.height ?? 36.0;

    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) ...[
            if (widget.isRequired) ...[
              SizedBox(
                width: widget.widthTitle,
                child: Row(
                  mainAxisAlignment: widget.textAlignEndTitle
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    RequiredLabel(
                      widget.title ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        fontFamily: 'Nunito',
                        color: AppColors.textBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              SizedBox(
                width: widget.widthTitle,
                child: Text(
                  widget.title ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    fontFamily: 'Nunito',
                    color: AppColors.textBlack,
                  ),
                  textAlign: widget.textAlignEndTitle ? TextAlign.end : null,
                ),
              ),
            ],
            spaceW12,
          ],
          if (widget.prevIconWidget != null) ...[
            widget.prevIconWidget!,
            spaceW8,
          ],
          Expanded(
            child: SizedBox(
              height: effectiveHeight,
              child: TextFormField(
                initialValue: widget.initialValue,
                maxLines: widget.maxLines ?? 1,
                controller: widget.controller,
                style: const TextStyle(
                  color: AppColors.textBlack,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Nunito',
                ),
                textAlign: widget.textAlign ?? TextAlign.start,
                decoration: InputDecoration(
                  suffixIcon: widget.suffixWidget ?? SizedBox(),
                  enabled: widget.isEnabled,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0xFFCBD2D9),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0xFFCBD2D9),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0xFFCBD2D9),
                    ),
                  ),
                  hintText: widget.hintText,
                  fillColor: widget.fillColor ?? Colors.white,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlack,
                    fontFamily: 'Nunito',
                  ),
                  filled: true,
                ),
                onChanged: widget.onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
