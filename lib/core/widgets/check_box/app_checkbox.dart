import 'package:account/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox(
      {super.key,
      required this.title,
      required this.value,
      required this.onChanged,
      this.widthTitle,
      this.textAlignEndTitle});

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final double? widthTitle;
  TextAlign? textAlignEndTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Checkbox(
          value: value,
          onChanged: (bool? newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
          activeColor: Colors.grey,
          checkColor: Colors.black,
        ),
        SizedBox(
          width: widthTitle,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            textAlign: textAlignEndTitle ?? TextAlign.end,
          ),
        ),
      ],
    );
  }
}
