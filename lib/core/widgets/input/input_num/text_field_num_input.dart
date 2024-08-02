import 'package:account/core/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../required_label.dart';
import 'num_input_type_enum.dart';

class TextFieldNumInput extends StatefulWidget {
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
  final NumInputTypeEnum numInputType;

  const TextFieldNumInput({
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
    //this.numInputType = NumInputTypeEnum.decimal,
    required this.numInputType,
  });

  @override
  State<TextFieldNumInput> createState() => _TextFieldNumInputState();
}

class _TextFieldNumInputState extends State<TextFieldNumInput> {
  @override
  Widget build(BuildContext context) {
    double effectiveHeight = widget.height ?? 36.0;

    return Row(
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
        SizedBox(
          height: effectiveHeight,
          width: widget.numInputType == NumInputTypeEnum.nonNegativeDecimalMax10
              ? 74
              : 80,
          child: TextFormField(
            keyboardType: TextInputType.numberWithOptions(
              decimal:
                  widget.numInputType == NumInputTypeEnum.nonNegativeInteger
                      ? false
                      : true,
              signed:
                  widget.numInputType == NumInputTypeEnum.decimal ? true : null,
            ),
            inputFormatters: [
              if (widget.numInputType ==
                  NumInputTypeEnum.nonNegativeInteger) ...[
                FilteringTextInputFormatter.allow(
                  //RegExp(r'^[1-9][0-9]*$|^0$'),
                  RegExp(r'^[1-9]\d*$'),
                ),
              ] else if (widget.numInputType ==
                  NumInputTypeEnum.nonNegativeDecimal) ...[
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}$'))
              ] else if (widget.numInputType ==
                  NumInputTypeEnum.nonNegativeDecimalMax100) ...[
                LengthLimitingTextInputFormatter(6),
                FilteringTextInputFormatter.allow(
                  RegExp(r'^(100|[1-9]?[0-9]?(\.\d{0,2})?)$'),
                ),
              ] else if (widget.numInputType ==
                  NumInputTypeEnum.nonNegativeDecimalMax10) ...[
                LengthLimitingTextInputFormatter(5),
                FilteringTextInputFormatter.allow(
                  RegExp(r'^(10|[0-9]?(\.\d{0,2})?)$'),
                ),
              ] else ...[
                FilteringTextInputFormatter.allow(
                  RegExp(r'^-?\d*\.?\d{0,2}$'),
                ),
              ],
            ],
            initialValue: widget.initialValue,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
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
            ),
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}
