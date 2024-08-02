import 'package:account/core/utils/spaces.dart';
import 'package:flutter/material.dart';

import 'required_label.dart';

class TextFieldDatePicker extends StatefulWidget {
  final String? title;
  final String? hintText;
  final Color? fillColor;
  final double? height;
  final bool isEnabled;
  final void Function(String?)? onChanged;
  final String? initialValue;
  final bool isRequired;
  final TextAlign? textAlign;
  final bool textAlignEndTitle;
  final double? widthTitle;
  final bool isCrossAxisAlignmentTopTitle;

  const TextFieldDatePicker({
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
    this.textAlignEndTitle = false,
    this.widthTitle,
    this.isCrossAxisAlignmentTopTitle = false,
  });

  @override
  State<TextFieldDatePicker> createState() => _TextFieldDatePickerState();
}

class _TextFieldDatePickerState extends State<TextFieldDatePicker> {
  @override
  Widget build(BuildContext context) {
    double effectiveHeight = widget.height ?? 36.0;

    return Expanded(
      child: Row(
        crossAxisAlignment: widget.isCrossAxisAlignmentTopTitle
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
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
                  ),
                  textAlign: widget.textAlignEndTitle ? TextAlign.end : null,
                ),
              ),
            ],
            spaceW12,
          ],
          Expanded(
            child: SizedBox(
              height: effectiveHeight,
              child: TextFormField(
                initialValue: widget.initialValue,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: widget.textAlign ?? TextAlign.start,
                decoration: InputDecoration(
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
                    color: Color(0xFF979797),
                  ),
                  filled: true,
                  suffixIcon: const Icon(Icons.calendar_month_outlined),
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
