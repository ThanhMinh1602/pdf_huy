import 'package:account/core/constants/app_color.dart';
import 'package:account/core/constants/app_style.dart';
import 'package:flutter/material.dart';

class TableCellDrop extends StatelessWidget {
  final int flex;
  final Color bgrColor;
  final Widget? child;
  final String? title;
  final EdgeInsetsGeometry? padding;
  final bool? isHeader;
  const TableCellDrop(
      {super.key,
      required this.flex,
      required this.bgrColor,
      this.child,
      this.title,
      this.padding,
      this.isHeader});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 50.0,
        padding: padding,
        alignment: (child != null || isHeader == true)
            ? Alignment.center
            : Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(horizontal: 1.0),
        decoration: BoxDecoration(
          color: bgrColor,
          border: Border.all(color: AppColor.c_B8E5FA, width: 0.5),
        ),
        child: child ??
            Text(title ?? '',
                style: isHeader == true
                    ? AppStyle.tableHeader
                    : AppStyle.tableRow),
      ),
    );
  }
}
