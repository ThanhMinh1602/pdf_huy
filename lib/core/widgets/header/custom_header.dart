import 'package:flutter/material.dart';

import '../../const/colors.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  CustomHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
            color: AppColors.mainMenu, borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.textBlack,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            )
          ],
        ));
  }
}
