import 'package:account/core/utils/spaces.dart';
import 'package:flutter/material.dart';

import '../../const/colors.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final bool isImportant;
  final Widget input;
  final EdgeInsets margin;

  CustomInput({
    super.key,
    required this.label,
    required this.isImportant,
    required this.input,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          spaceW30,
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 14,
              color: AppColors.textBlack,
            ),
          ),
          if (isImportant)
            Text(
              '*',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 14,
                color: AppColors.redBoder,
              ),
            ),
          SizedBox(width: 10),
          input,
        ],
      ),
    );
  }
}
