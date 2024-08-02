
import 'package:account/core/constants/app_color.dart';
import 'package:account/core/constants/app_style.dart';
import 'package:flutter/material.dart';

class CustomTableCell extends StatelessWidget {
  final String text;
  final bool? isHeader;

  const CustomTableCell({required this.text, this.isHeader, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isHeader == true ? 48.0 : 40.0,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(
            color: AppColor.c_FFFFFF,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 14,
          ),
          Text(
            text,
            style: isHeader == true ? AppStyle.tableHeader : AppStyle.tableRow,
          ),
        ],
      ),
    );
  }
}
